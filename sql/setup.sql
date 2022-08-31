DROP TABLE if exists users CASCADE;
DROP TABLE if exists cards CASCADE;
DROP TABLE if exists user_cards CASCADE;
DROP TABLE if exists meanings CASCADE;
DROP TABLE if exists authors CASCADE;
DROP TABLE if exists pamela CASCADE;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    username TEXT NOT NULL
);

INSERT into users (username, email, password_hash) values
('Amanda', 'amanda@hecht.com', 'crowley'),
('Amaya', 'amaya@maya.com','trout'),
('David', 'david@lol.com', 'lol'),
('niki', 'niki@hite.com', 'pink');

CREATE TABLE cards (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    position_id TEXT NOT NULL,
    arcana TEXT NOT NULL,
    suit_id VARCHAR NOT NULL,
    image TEXT NOT NULL
);

INSERT into cards (name, position_id, arcana, suit_id, image) values
('the fool', '0', 'major', 'major','m00.jpg'),
('the magician', '1', 'major', 'major','m01.jpg'),
('the high preistess', '2', 'major', 'major','m02.jpg'),
('the empress', '3', 'major', 'major','m03.jpg'),
('the emperor', '4', 'major', 'major','m04.jpg'),
('the hierophant', '5', 'major', 'major','m05.jpg'),
('the lovers', '6', 'major', 'major','m06.jpg'),
('the chariot', '7', 'major', 'major','m07.jpg'),
('strength', '8', 'major', 'major','m08.jpg'),
('the hermit', '9', 'major', 'major','m09.jpg'),
('wheel of fortune', '10', 'major', 'major','m010.jpg'),
('justice', '11', 'major', 'major','m011.jpg'),
('the hanged man', '12', 'major', 'major','m012.jpg'),
('death', '13', 'major', 'major','m05.jpg'),
('temperance', '14', 'major', 'major','m014.jpg'),
('the devil', '15', 'major', 'major','m015.jpg'),
('the tower', '16', 'major', 'major','m016.jpg'),
('the star', '17', 'major', 'major','m017.jpg'),
('the moon', '18', 'major', 'major','m018.jpg'),
('the sun', '19', 'major', 'major','m019.jpg'),
('the judgement', '20', 'major', 'major','m20.jpg'),
('the world', '21', 'major', 'major','m32.jpg'),

('ace of cups', '22', 'minor', 'cups','c01.jpg'),
('two of cups', '23', 'minor', 'cups','c02.jpg'),
('three of cups', '24', 'minor', 'cups','c03.jpg'),
('four of cups', '25', 'minor', 'cups','c04.jpg'),
('five of cups', '26', 'minor', 'cups','c05.jpg'),
('six of cups', '27', 'minor', 'cups','c06.jpg'),
('seven of cups', '28', 'minor', 'cups','c07.jpg'),
('eight of cups', '29', 'minor', 'cups','c08.jpg'),
('nine of cups', '30', 'minor', 'cups','c09.jpg'),
('ten of cups', '31', 'minor', 'cups','c10.jpg'),
('page of cups', '32', 'minor', 'cups','c11.jpg'),
('knight of cups', '33', 'minor', 'cups','c12.jpg'),
('queen of cups', '34', 'minor', 'cups','c13.jpg'),
('king of cups', '35', 'minor', 'cups','c14.jpg'),

('ace of swords', '36', 'minor', 'swords', 's01.jpg'),
('two of swords', '37', 'minor', 'swords','s02.jpg'),
('three of swords', '38', 'minor', 'swords','s03.jpg'),
('four of swords', '39', 'minor', 'swords','s04.jpg'),
('five of swords', '40', 'minor', 'swords','s05.jpg'),
('six of swords', '41', 'minor', 'swords','s06.jpg'),
('seven of swords', '42', 'minor', 'swords','s07.jpg'),
('eight of swords', '43', 'minor', 'swords','s08.jpg'),
('nine of swords', '44', 'minor', 'swords','s09.jpg'),
('ten of swords', '45', 'minor', 'swords','s10.jpg'),
('page of swords', '46', 'minor', 'swords','s11.jpg'),
('knight of swords', '47', 'minor', 'swords','s12.jpg'),
('queen of swords', '48', 'minor', 'swords','s13.jpg'),
('king of swords', '49', 'minor', 'swords','s14.jpg'),

('ace of wands', '50', 'minor', 'wands', 'w01.jpg'),
('two of wands', '51', 'minor', 'wands','w02.jpg'),
('three of wands', '52', 'minor', 'wands','w03.jpg'),
('four of wands', '53', 'minor', 'wands','w04.jpg'),
('five of wands', '54', 'minor', 'wands','w05.jpg'),
('six of wands', '55', 'minor', 'wands','w06.jpg'),
('seven of wands', '56', 'minor', 'wands','w07.jpg'),
('eight of wands', '57', 'minor', 'wands','w08.jpg'),
('nine of wands', '58', 'minor', 'wands','w09.jpg'),
('ten of wands', '59', 'minor', 'wands','w10.jpg'),
('page of wands', '60', 'minor', 'wands','w11.jpg'),
('knight of wands', '61', 'minor', 'wands','w12.jpg'),
('queen of wands', '62', 'minor', 'wands','w13.jpg'),
('king of wands', '63', 'minor', 'wands','w14.jpg'),

('ace of pentacles', '64', 'minor', 'pentacles', 'w01.jpg'),
('two of pentacles', '65', 'minor', 'pentacles','w02.jpg'),
('three of pentacles', '66', 'minor', 'pentacles','w03.jpg'),
('four of pentacles', '67', 'minor', 'pentacles','w04.jpg'),
('five of pentacles', '68', 'minor', 'pentacles','w05.jpg'),
('six of pentacles', '69', 'minor', 'pentacles','w06.jpg'),
('seven of pentacles', '70', 'minor', 'pentacles','w07.jpg'),
('eight of pentacles', '71', 'minor', 'pentacles','w08.jpg'),
('nine of pentacles', '72', 'minor', 'pentacles','w09.jpg'),
('ten of pentacles', '73', 'minor', 'pentacles','w10.jpg'),
('page of pentacles', '74', 'minor', 'pentacles','w11.jpg'),
('knight of pentacles', '75', 'minor', 'pentacles','w12.jpg'),
('queen of pentacles', '76', 'minor', 'pentacles','w13.jpg'),
('king of pentacles', '77', 'minor', 'pentacles','w14.jpg');

CREATE TABLE user_cards (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id),
    card_id BIGINT NOT NULL REFERENCES cards(id)
);

INSERT INTO user_cards (user_id, card_id) VALUES 
(1,1),
(2,3),
(3,5),
(4,6),
(1,4),
(2,7),
(3,1),
(4,23);


CREATE TABLE meanings(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    card_id INT NOT NULL,
    name VARCHAR NOT NULL,
    number INTEGER  NOT NULL,
    keyword_0 VARCHAR NOT NULL,
    keyword_1 VARCHAR NOT NULL,
    keyword_2 VARCHAR NOT NULL,
    meaning_0 VARCHAR NOT NULL,
    meaning_1 VARCHAR NOT NULL,
    meaning_2 VARCHAR NOT NULL,
    FOREIGN KEY (card_id) REFERENCES cards(id)
);

INSERT INTO meanings (card_id,name,number,keyword_0,keyword_1,keyword_2,meaning_0,meaning_1,meaning_2) VALUES
(1,'The Fool',0,'freedom','faith','inexperience','Freeing yourself from limitation','Expressing joy and youthful vigor','Being open-minded'),
(2,'The Magician',1,'capability','empowerment','activity','Taking appropriate action','Receiving guidance from a higher power','Becoming a channel of divine will'),
(3,'The High Priestess',2,'intuition','reflection','purity','Listening to your feelings and intuitions','Exploring unconventional spirituality','Keeping secrets'),
(4,'The Empress',3,'fertility','productivity','ripeness','Nurturing yourself and others','Bearing fruit','Celebrating your body'),
(5,'The Emperor',4,'authority','regulation','direction','Exercising authority','Defining limits','Directing the flow of work'),
(6,'The Hierophant',5,'guidance','knowledge','revelation','Teaching or guiding others','Searching for the truth','Asking for guidance from a higher power'),
(7,'The Lovers',6,'love','passion','unity','Being in love','Showing your love to others','Expressing passion or romantic feelings'),
(8,'The Chariot',7,'advancement','victory','triumph','Breaking through barriers','Moving forward with confidence and authority','Reaching the pinnacle of success'),
(9,'Strength',8,'discipline','boldness','self-discipline','Imposing restrictions on yourself for your own benefit','Bringing your passions under the control of reason','Resisting impulses that work against your best interests'),
(10,'The Hermit',9,'solitude','experience','stillness','Becoming or seeking out a guru','Going on a retreat','Recharging spiritual or creative batteries'),
(11,'Wheel of Fortune',10,'luck','randomness','cycles','Allowing events to unfold','Seeing the larger pattern in everyday events','Trusting your luck'),
(12,'Justice',11,'balance','law','fairness','Making an objective decision','Weighing an issue carefully before taking action','Appropriately scaling your reaction to a situation'),
(13,'The Hanged Man',12,'enlightenment','sacrifice','perspective','Seeing growth opportunities in unpleasant events','Experiencing a dramatic change in personal perspective','Making the best of an unforeseen change in your life or work'),
(14,'Death',13,'ending','conclusion','transition','Bringing an unpleasant phase of life to an end','Recognizing and celebrating the conclusion of something','Putting bad habits to rest'),
(15,'Temperance',14,'blending','synthesis','mediation','Bringing opposites together','Moderating your actions or emotions','Finding middle ground'),
(16,'The Devil',15,'shadow','materialism','bondage','Appreciating the luxuries that life has to offer','Being comfortable in your own skin','Enjoying your sexuality'),
(17,'The Tower',16,'demolition','upheaval','deconstruction','Breaking out of old, confining habits and mindsets','Clearing the way for new growth','Dispelling the influence of an inflated ego'),
(18,'The Star',17,'hope','optimism','openness','Hoping for the best','Believing good things happen to good people','Seeing events in the best possible light'),
(19,'The Moon',18,'mystery','fantasy','imagination','Enjoying healthy fantasies and daydreams','Using your imagination','Practicing magic or celebrating the magic of everyday life'),
(20,'The Sun',19,'joy','brilliance','validation','Seeing things clearly','Experiencing intense joy','Celebrating your own successes'),
(21,'Judgement',20,'revival','renewal','resurrection','Receiving a wake-up call','Discovering a new purpose in life','Becoming totally and completely yourself'),
(22,'The World',21,'wholeness','integration','totality','Having it all','Knowing and loving yourself as completely as possible','Seeing the interconnection of all things and people'),
(23,'Ace of Cups',1,'intuition','spirituality','affection','Trusting your feelings','Opening yourself to spirit','Accepting and returning affection'),
(24,'Two of Cups',2,'union','attraction','combination','Being drawn to someone','Longing for someone or something','Acting on your desires'),
(25,'Three of Cups',3,'celebration','expression','community','Celebrating your feelings or connections with others','Expressing joy through song, dance, or physical affection','Working together with others who share your feelings'),
(26,'Four of Cups',4,'boredom','listlessness','lethargy','Maintaining your emotional stability','Refusing to give in to overwhelming emotions','Appreciating what you have and refusing to take it for granted'),
(27,'Five of Cups',5,'loss','despair','re-evaluation','Acknowledging loss and moving on','Focusing on how the glass remains "half-full"','Finding the silver lining in a dark cloud'),
(28,'Six of Cups',6,'charity','sharing','sacrifice','Donating your time and talents to others','Taking satisfaction in knowing how your efforts will aid others','Creating a "win-win" scenario'),
(29,'Seven of Cups',7,'imagination','dreams','illusions','Motivating yourself with images of future success','Using visualization to encourage progress','Taking an imaginative or creative approach to problem solving'),
(30,'Eight of Cups',8,'longing','dissatisfaction','quest','Wanting something better','Blazing your own trail','Realizing there must be more to life'),
(31,'Nine of Cups',9,'satisfaction','sensuality','luxury','Being delighted with your own achievements','Recognizing your own talents and abilities','Reveling in the good things life has to offer'),
(32,'Ten of Cups',10,'joy','fulfillment','overwhelming emotion','Having more than you ever dreamed','Being deeply thankful for all you''ve been given','Recognizing the Hand of God in the gifts the Universe brings your way'),
(33,'Page of Cups',11,'enthusiasm','first impressions','romanticism','Showing your emotions freely','Throwing yourself into romance','Nursing a secret crush'),
(34,'Knight of Cups',12,'fervor','zeal','moodiness','Being deeply committed to a cause','Giving in to strong emotions, from excitement to depression','Acting on intuition alone'),
(35,'Queen of Cups',13,'insightfulness','spirituality','compassion','Allowing yourself to be moved by the plight of others','Feeling strong emotions','Possessing unusual sympathy or empathy'),
(36,'King of Cups',14,'wisdom','diplomacy','restraint','Keeping a stiff upper lip','Being brave and clear in the face of adverse circumstances','Sharing experience as a way of comforting others'),
(37,'Ace of Swords',1,'logic','objectivity','intellect','Making objective decisions','Applying logic','Reasoning your way out of a difficult situation'),
(38,'Two of Swords',2,'denial','debate','impasse','Refusing to make a decision without getting the facts','Exploring both sides of an argument','Arguing passionately for what you believe in'),
(39,'Three of Swords',3,'variance','difference','dissatisfaction','Being brave enough to see things as they really are','Exercising your critical eye','Being your own best critic'),
(40,'Four of Swords',4,'meditation','contemplation','perspective','Thinking over your plans before putting them into action','Pausing to meditate or clear your mind','Taking time to understand someone or something before criticizing it'),
(41,'Five of Swords',5,'selfishness','hostility','irrationality','Acting in your own best interest','Choosing to stand up for yourself','Not backing down from disagreement and discord'),
(42,'Six of Swords',6,'adaptation','adjustments','science','Making the best of a bad situation','Recovering from defeat','Resetting expectations'),
(43,'Seven of Swords',7,'dishonesty','presumption','sneakiness','Refusing to do something dishonest, even when there''s no chance of ever being caught','Handling a difficult situation with finesse','Pointing out assumptions'),
(44,'Eight of Swords',8,'restriction','limitation','confinement','Honoring limits','Respecting the rules','Deciding to go on a diet for your health''s sake'),
(45,'Nine of Swords',9,'remorse','worry','distraught','Refusing to worry about what you cannot control','Rejecting anxiety','Judging your own performance with kindness and gentleness'),
(46,'Ten of Swords',10,'exhaustion','ruin','disaster','Seeing the signs that you''ve reached your limits','Paying attention to what your body is trying to tell you','Giving in to the need for rest and renewal'),
(47,'Page of Swords',11,'student','apprentice','scholarship','Pursuing a course of study','Asking good questions','Investing time in study and practice'),
(48,'Knight of Swords',12,'bluntness','intelligence','incisiveness','Speaking your mind','Making your opinions known','Offering constructive criticism'),
(49,'Queen of Swords',13,'grace','skill','wit','Exercising tact or using diplomacy','Defusing a tense situation','Knowing what to say and how to say it'),
(50,'King of Swords',14,'genius','expertise','decision','Expressing yourself with firmness and authority','Rendering a final decision','Consulting an expert'),
(51,'Ace of Wands',1,'desire','inspiration','vision','Being inspired','Identifying an important goal','Being given the opportunity to do whatever you want to do'),
(52,'Two of Wands',2,'conflict','decision','option','Having a choice','Offering or being offered an option','Seeing the value of another person''s approach'),
(53,'Three of Wands',3,'implementation','action','exploration','Putting a plan into motion','Taking that critical first step','Making good things happen'),
(54,'Four of Wands',4,'celebration','jubilation','community','Sharing in a great celebration','Sharing in a communal sense of achievement and success','Preparing for a party'),
(55,'Five of Wands',5,'confrontation','disruption','distinction','Calmly expressing a dissenting opinion','Allowing someone to use his or her own methods to get a job done','Opening the floor for discussion or debate'),
(56,'Six of Wands',6,'victory','achievement','success','Outperforming your peers','Winning a competition','Being recognized as a capable person'),
(57,'Seven of Wands',7,'bravery','resolve','determination','Refusing to be silenced through fear or intimidation','Continuing a fight against all odds','Being fierce'),
(58,'Eight of Wands',8,'speed','swiftness','responsiveness','Taking swift action','Moving forward with a plan as quickly as possible','Energizing yourself'),
(59,'Nine of Wands',9,'toughness','persistence','stamina','Sticking with it for the duration','Fulfilling your promises and obligations','Bearing up under incredible duress'),
(60,'Ten of Wands',10,'exhaustion','resistance','burden','Holding your own in extreme circumstances','Helping others carry their burdens','Coming to the aid of the oppressed'),
(61,'Page of Wands',11,'enthusiasm','eagerness','confidence','Leaping at a new opportunity','Being a cheerleader or ardent advocate for your cause','Being a True Believer'),
(62,'Knight of Wands',12,'boldness','bravado','passion','Charging ahead','Making rapid progress','Refusing limits'),
(63,'Queen of Wands',13,'attention','attraction','unification','Paying close attention','Helping others focus on the issue at hand','Getting everyone to work together'),
(64,'King of Wands',14,'creativity','ingenuity','achievement','Putting old things together in new and exciting ways','Coming up with unexpected solutions','Using your experience to solve puzzles and problems'),
(65,'Ace of Pentacles',1,'health','wealth','practicality','Outlining a plan for achieving prosperity','Becoming aware of opportunities to improve income or health','Realizing you have everything you need'),
(66,'Two of Pentacles',2,'evaluation','decision','budgeting','Weighing options','Comparing prices','Determining the value of one option over another'),
(67,'Three of Pentacles',3,'expression','production','work','Finishing a project','Setting and meeting standards','Performing according to specifications'),
(68,'Four of Pentacles',4,'protection','conservation','preservation','Saving for a rainy day','Fasting as part of a spiritual practice','Dieting in an effort to improve your body'),
(69,'Five of Pentacles',5,'poverty','destitution','need','Recognizing your needs and taking action to fulfill them','Doing as much as you can do with what little you have','Admitting you need help'),
(70,'Six of Pentacles',6,'charity','fairness','cooperation','Giving time, money, or effort to a charity','Taking part in a group effort','Lending your resources to others without expecting anything in return'),
(71,'Seven of Pentacles',7,'assessment','evaluation','re-evaluation','Measuring progress toward your goal','Looking at results with an eye toward improving performance','Asking, "How happy am I?"'),
(72,'Eight of Pentacles',8,'effort','work diligence','skill','Doing your best','Bringing enthusiasm and zeal to your work','Making an effort to be the best you can be'),
(73,'Nine of Pentacles',9,'training','discipline','confidence','Investing time in learning or teaching a difficult task','Restraining yourself from physical or financial extremes','Making sacrifices as a way of achieving larger goals'),
(74,'Ten of Pentacles',10,'wealth','abundance','acquisition','Celebrating your physical and financial blessings','Realizing how lucky or how blessed you are','Being satisfied with your physical and financial achievements'),
(75,'Page of Pentacles',11,'practicality','prosperity','learning','Learning the value of a dollar','Starting a savings plan','Taking the first steps toward getting out of debt'),
(76,'Knight of Pentacles',12,'caution','focus','realism','Spending money wisely','Saving for a rainy day','Paying close attention to physical or financial details'),
(77,'Queen of Pentacles',13,'luxury','comfort','resourcefulness','Appreciating fine food, fine wine, beautiful art, beautiful bodies, or any of the better things in life','Reveling in healthy sexuality','Treating yourself'),
(78,'King of Pentacles',14,'stability','dependability','confidence','Becoming debt-free','Having more than enough to get by','Making contributions to a savings plan');

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    github VARCHAR,
    linkedin VARCHAR,
    photo VARCHAR,
    tarot_card VARCHAR
);

INSERT INTO authors (name, github, linkedin, photo, tarot_card) VALUES 
('Amanda Hecht','https://github.com/amanda-hecht89','https://www.linkedin.com/in/amanda-hecht/','a','a'),
('Amaya Alejandra','https://github.com/amayamaya','https://www.linkedin.com/in/amayamaya/','b','b'),
('David Fransico','https://github.com/dfrancisco26','https://www.linkedin.com/in/davidn0tdave/','c','c'),
('Niki Hite','https://github.com/nikihite','https://www.linkedin.com/in/nikihite/','d','d');


CREATE TABLE pamela (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    life_span VARCHAR,
    photo VARCHAR,
    bio VARCHAR
);

INSERT INTO pamela (name, life_span, photo, bio) VALUES 
('pamela','1900-1900', 'a', 'a' )
