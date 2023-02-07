DROP DATABASE rgucw3;

CREATE DATABASE rgucw3;

USE rgucw3;

CREATE TABLE publication
	(
        publication_id VARCHAR(20) NOT NULL,
     	category VARCHAR(20) NOT NULL,
        CONSTRAINT PRIMARY KEY(publication_id)
    );
INSERT INTO 
publication (publication_id,category)
VALUES
('C00001','Computer Science'),
('C00002','Medicine'),
('C00003','Computer Science'),
('C00004','Engineering'),
('C00005','Philosophy'),
('C00006','Computer Science'),
('C00007','Biology'),
('C00008','History'),
('C00009','Geography'),
('C00010','History'),	
('C00011','Fiction'),
('C00012','Children'),
('C00013','Teenage'),
('C00014','Fiction'),
('C00015','Poetry'),
('C00016','Children');

CREATE TABLE librarian
	(
        employee_id VARCHAR(15) NOT NULL,
        l_fname VARCHAR(25) NOT NULL,
        l_lname VARCHAR(25),
        CONSTRAINT PRIMARY KEY(employee_id)
    );

INSERT INTO 
librarian(employee_id,l_fname,l_lname)
VALUES
('E00001','Rajitha','Karunanayaka'),
('E00002','Chammi','Perera'),
('E00003','Kusum',Null),
('E00004','Buwaneka','De Silva'),
('E00005','Anne','Fernando');

CREATE TABLE order_P
	(
         order_no VARCHAR(15) NOT NULL,
         employee_id VARCHAR(15) NOT NULL,
         order_date DATE NOT NULL,
         received_date DATE NOT NULL,
         CONSTRAINT PRIMARY KEY(order_no),
         CONSTRAINT orderp_e_fk FOREIGN KEY(employee_id) REFERENCES librarian(employee_id)
    );

INSERT INTO 
order_P(order_no,employee_id,order_date,received_date)
VALUES
('O10012','E00001','2021-10-30','2021-11-15'),
('O10013','E00002','2021-09-17','2021-11-25'),
('O10014','E00003','2021-08-01','2021-10-22'),
('O10015','E00005','2000-03-30','2000-07-15'),
('O10016','E00005','2000-01-20','2000-05-27'),
('O10017','E00003','2020-01-20','2020-08-27'),
('O10018','E00002','1999-01-20','1999-10-27');

                         
CREATE TABLE academic_journal
	(
        publication_id VARCHAR(20) NOT NULL,
        description VARCHAR(75),
        subcription_cost INTEGER(5),
        publish_year INTEGER(4),
        journal_name VARCHAR(20),
        publish_name VARCHAR(20), 
        CONSTRAINT PRIMARY KEY(publication_id),
        CONSTRAINT academicj_p_fk FOREIGN KEY(publication_id) REFERENCES publication(publication_id)
    );

INSERT INTO 
academic_journal(publication_id,description,subcription_cost,publish_year,journal_name,publish_name) 
VALUES
('C00001','This journal contain research related to AI','01000','2010','The Future AI','Random House'),
('C00002','This journal contain research related to Cancer','02000','2015','Cancer','Penguin Books'),
('C00003','This journal contain research related to Bioinformatics','02300','2016','BioData Mining','Gray Wolf'),
('C00004','This journal contain research related to Material Engineering','01300','2020','The Structure','Random House'),
('C00005','This journal contain research related to philosophy and science','10000','2013','The Wisdom','Wisdom House');


CREATE TABLE AcademicBook
	(
         publication_id VARCHAR(20) NOT NULL,
         book_name VARCHAR(50) NOT NULL,
         printed_year INTEGER(4),
         order_no VARCHAR(15),
         CONSTRAINT PRIMARY KEY(publication_id),
         CONSTRAINT academicb_p_fk FOREIGN KEY(publication_id) REFERENCES publication(publication_id),
         CONSTRAINT academicb_O_fk FOREIGN KEY(order_no) REFERENCES order_P(order_no)
    );
                           
INSERT INTO 
AcademicBook(publication_id,book_name,printed_year,order_no) 
VALUES
('C00006','Learn Python','2000',NULL),
('C00007','Human Body','2001','O10017'),
('C00008','A brief History of Time','2000',NULL),
('C00009','Silent Spring','2003',NULL),
('C00010','Naked Ape','2005','O10018');


CREATE TABLE article
	(	 
         article_id VARCHAR(10) NOT NULL,
         publication_id VARCHAR(20) NOT NULL,
         title VARCHAR(100) NOT NULL,
         abstract VARCHAR(175),
         volume_no VARCHAR(4) NOT NULL,
         issue_no VARCHAR(25) NOT NULL,
         CONSTRAINT PRIMARY KEY(article_id),
         CONSTRAINT article_p_fk FOREIGN KEY(publication_id) REFERENCES academic_journal(publication_id)
        
    );
    
INSERT INTO 
article(article_id,publication_id,title,abstract,volume_no,issue_no) 
VALUES
('A00001','C00001','State of AI by 2030','This article is Ygor effort to summarise the key takeaways from the third installment of the article State of AI','10','4'),
('A00002','C00002','Diagnosis and Detection of Pancreatic Cancer','Computed tomography is the first-line imaging modality for suspected pancreatic cancer.','11','3'),
('A00003','C00003','Predective modeling of gene expression regulation','In depth analysis of regulation networks of genes aberrantly expressed in cancer is essential for better understanding of tumors','12','5'),
('A00004','C00004','Strengthening mechanisms in selective laser melted 316L stainless steel','The microstructure and chemical composition of 316L stainless steel prepared by selective laser melting have been characterized using electron backscatter diffraction.','1','2'),
('A00005','C00005','The Art of Chemical Bond','Chemical bonding enables scientists to take the 100 plus elements of the periodic table and combine them in myriad ways to form chemical compounds.','3','8');

CREATE TABLE aurthor
	(
         article_id VARCHAR(10) NOT NULL,
         a_name VARCHAR(25) NOT NULL,
         CONSTRAINT PRIMARY KEY(article_id),
         CONSTRAINT aurthor_a_fk FOREIGN KEY(article_id) REFERENCES article(article_id)
                          
    ); 
    
INSERT INTO 
aurthor(article_id,a_name) 
VALUES
('A00001','W.A Rollings'),
('A00002','P. Albert'),
('A00003','A. Shuman'),
('A00004','Peter Cobbe'),
('A00005','Thomas Scavern');


CREATE TABLE LibraryUser
	(
         user_id VARCHAR(10) NOT NULL,
         publication_id VARCHAR(20) NOT NULL,
         u_fname VARCHAR(25) NOT NULL,
         u_lname VARCHAR(25) NOT NULL,
         date_of_birth DATE,
         gender CHARACTER(1),
         CONSTRAINT PRIMARY KEY(user_id),
         CONSTRAINT libraryuser_p_fk FOREIGN KEY(publication_id) REFERENCES Academicbook(publication_id)
    );
    
INSERT INTO 
LibraryUser(user_id,publication_id,u_fname,u_lname,date_of_birth,gender)
VALUES
('U00006','C00006','Saman','Gunawardana','1980-12-07','M'),
('U00007','C00007','Biman','De Silva','1985-11-17','M'),
('U00008','C00008','Amal','Perera','2001-12-08','M'),
('U00009','C00009','Chathumini','Perera','1999-12-07','F'),
('U00010','C00010','Osandi','Karunanayaka','1995-05-07','F');


CREATE TABLE contact_no_user
	(
        mobile_no VARCHAR(15) NOT NULL,
        user_id VARCHAR(10) NOT NULL,
        CONSTRAINT contact_no_u_fk FOREIGN KEY(user_id) REFERENCES LibraryUser(user_id)
    );

INSERT INTO 
contact_no_user(mobile_no,user_id) 
VALUES
('0712356712','U00006'),
('0712356778','U00007'),
('0762856712','U00008'),
('0712300912','U00009'),
('0709756712','U00010');

           
CREATE TABLE copy
	(
        copy_id VARCHAR(15) NOT NULL,
        user_id VARCHAR(15) NOT NULL,
        CONSTRAINT PRIMARY KEY(copy_id),
        CONSTRAINT copy_c_u_fk FOREIGN KEY(user_id) REFERENCES LibraryUser(user_id)
    );
    
INSERT INTO 
copy(copy_id,user_id) 
VALUES
('Q0006','U00006'),
('Q0007','U00007'),
('Q0008','U00008'),
('Q0009','U00009'),
('Q0010','U00010');


CREATE TABLE consists
	(
         publication_id VARCHAR(20) NOT NULL,
         copy_id VARCHAR(20) NOT NULL,
         order_no VARCHAR(15) NOT NULL,
         CONSTRAINT PRIMARY KEY(copy_id,order_no),
         CONSTRAINT consists_p_fk FOREIGN KEY(publication_id) REFERENCES Academicbook(publication_id),
         CONSTRAINT consists_o_fk FOREIGN KEY(order_no) REFERENCES order_p(order_no),
         CONSTRAINT consists_c_fk FOREIGN KEY(copy_id) REFERENCES copy(copy_id)
    );

INSERT INTO 
consists(publication_id,copy_id,order_no)
VALUES
('C00006','Q0006','O10012'),
('C00007','Q0007','O10013'),
('C00008','Q0008','O10014'),
('C00009','Q0009','O10015'),
('C00010','Q0010','O10016');
                      
CREATE TABLE LibraryUser_AcademicBook
	(
         user_id VARCHAR(15) NOT NULL,
         publication_id VARCHAR(20) NOT NULL,
         CONSTRAINT p_id_la FOREIGN KEY(publication_id) REFERENCES Academicbook(publication_id),
         CONSTRAINT u_id FOREIGN KEY(user_id) REFERENCES LibraryUser(user_id)
         
    );

INSERT INTO 
LibraryUser_AcademicBook(user_id,publication_id) 
VALUES
('U00006','C00006'),
('U00007','C00007'),
('U00008','C00008'),
('U00009','C00009'),
('U00010','C00010');
              

SELECT book_name
FROM Academicbook
WHERE printed_year='2000';

SELECT publish_name,description
FROM academic_journal
WHERE journal_name='The Wisdom';

SELECT book_name FROM Academicbook JOIN LibraryUser JOIN LibraryUser_AcademicBook  
ON LibraryUser_AcademicBook.user_id=LibraryUser.user_id AND LibraryUser_AcademicBook.publication_id=Academicbook.publication_id
WHERE u_fname='Amal' and u_lname='Perera';

SELECT employee_id
FROM librarian
WHERE l_fname='Anne' and l_lname='Fernando';

SELECT COUNT(order_no) 
FROM order_p 
WHERE employee_id='E00005' and order_date<='2000-03-31';




