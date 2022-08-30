const bcrypt = require('bcrypt');
const User = require('../models/User');
const jwt = require('jsonwebtoken');

module.exports = class UserService {
  static async create({ email, password, username }) {
    const passwordHash = await bcrypt.hash(
      password, Number(process.env.SALT_ROUNDS)
    );
  
    const user = await User.insert({
      email, passwordHash, username,
    });
    const token = jwt.sign({ ...user }, process.env.JWT_SECRET, {
      expiresIn: '1 day',
    });
    return [user, token];
  }
    
  static async signIn({ email, password = '' }) {
    try { 
      const user = await User.getByEmail(email);
      if(!user) throw new Error('Invalid email');
      if(!bcrypt.compareSync(password, user.passwordHash))
        throw new Error('Invalid password');
            
      const token = jwt.sign({ ...user }, process.env.JWT_SECRET, {
        expiresIn: '1 day',
      });
            
      return token;
    } catch (error) {
      error.status = 401;
      throw error;
    }
  }
};
