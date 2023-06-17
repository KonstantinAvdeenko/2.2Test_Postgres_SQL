
CREATE TABLE Avtori
( id SERIAL PRIMARY KEY,
  FIO varchar (255) NOT NULL,
  Soavtor1 varchar (100) default NULL,
  Soavtor2 varchar (100) default NULL
 );

CREATE TABLE Izdatelstva
( id SERIAL PRIMARY KEY,
  Nazvanie_izdatelstva varchar (255) NOT NULL,
  Gorod varchar (255) default NULL);

CREATE TABLE Nazvanie_books
( id SERIAL PRIMARY KEY,
  Nazvanie_book varchar (255) NOT NULL);

CREATE TABLE Schanri_books
( id SERIAL PRIMARY KEY,
  Schanr_book varchar (255) NOT NULL);

CREATE TABLE Chitateli
( Nomer_chitatelskogo_bileta SERIAL PRIMARY KEY,
  FIO varchar (255) NOT NULL,
  Adres varchar (255) NOT NULL,
  Telephone INT default NULL);

CREATE TABLE Sotrudniki
( id SERIAL PRIMARY KEY,
  FIO varchar (255) NOT NULL,
  Adres varchar (255) NOT NULL,
  Telephone INT default NULL);

CREATE TABLE Uchetnyi_god
( id SERIAL PRIMARY KEY,
  God_ucheta  INT NOT NULL,
  Schanr INT NOT NULL,
  CONSTRAINT Schanri_books_Schanr_fk
  FOREIGN KEY (Schanr)
  REFERENCES Schanri_books (id),
  Izdatelstvo INT NOT NULL,
  CONSTRAINT Izdatelstva_Izdatelstvo_fk
  FOREIGN KEY (Izdatelstvo)
  REFERENCES Izdatelstva (id),
  Avtor INT NOT NULL,
  CONSTRAINT Avtori_Avtor_fk
  FOREIGN KEY (Avtor)
  REFERENCES Avtori (id), 
  Nazvanie INT NOT NULL,
  CONSTRAINT Nazvanie_books_Nazvanie_fk
  FOREIGN KEY (Nazvanie)
  REFERENCES Nazvanie_books (id)); 

CREATE TABLE Books
( Shifr_book SERIAL PRIMARY KEY,
  Nazvanie INT NOT NULL,
  CONSTRAINT Nazvanie_books_Nazvanie_fk
  FOREIGN KEY (Nazvanie)
  REFERENCES Nazvanie_books (id),
  Schanr INT NOT NULL,
  CONSTRAINT Schanri_books_Schanr_fk
  FOREIGN KEY (Schanr)
  REFERENCES Schanri_books (id),
  Izdatelstvo INT NOT NULL,
  CONSTRAINT Izdatelstva_Izdatelstvo_fk
  FOREIGN KEY (Izdatelstvo)
  REFERENCES Izdatelstva (id),
  Avtor INT NOT NULL,
  CONSTRAINT Avtori_Avtor_fk
  FOREIGN KEY (Avtor)
  REFERENCES Avtori (id), 
  God_izdaniya INT default NULL,
  Obem_stranitc INT default NULL,
  Cena INT default NULL,
  Kolithestvo_ekzemplyarov_v_fonde INT default NULL,
  Kolithestvo_vidannih_ekzemplyarov_na_tekushii_moment INT default NULL );

CREATE TABLE Vidatha_books
(id SERIAL PRIMARY KEY,
 Nazvanie INT NOT NULL,
 CONSTRAINT Nazvanie_books_Nazvanie_fk
 FOREIGN KEY (Nazvanie)
 REFERENCES Nazvanie_books (id),
 Nalichie varchar (255) NOT NULL,
 Nomer_bilet_chitatel INT NOT NULL,
 CONSTRAINT Chitateli_Nomer_bilet_chitatel_fk
 FOREIGN KEY (Nomer_bilet_chitatel)
 REFERENCES Chitateli (Nomer_chitatelskogo_bileta),
 Shifr_book INT NOT NULL,
 CONSTRAINT Books_Shifr_book_fk
 FOREIGN KEY (Shifr_book)
 REFERENCES Books (Shifr_book),
 Date_vidachi TIMESTAMP NOT NULL,
 Vidal_sotrudnik INT NOT NULL,
 CONSTRAINT Sotrudniki_Vidal_sotrudnik_fk
 FOREIGN KEY (Vidal_sotrudnik)
 REFERENCES Sotrudniki (id),
 Uchetnyi_god INT NOT NULL,
 CONSTRAINT Uchetnyi_god_Uchetnyi_god_fk
 FOREIGN KEY (Uchetnyi_god)
 REFERENCES Uchetnyi_god (id));

CREATE TABLE Vozvrat_books
(id SERIAL PRIMARY KEY,
 id_vidachi INT NOT NULL,
 CONSTRAINT Vidatha_books_id_vidachi_fk
 FOREIGN KEY (id_vidachi)
 REFERENCES Vidatha_books (id),
 Nazvanie INT NOT NULL,
 CONSTRAINT Nazvanie_books_Nazvanie_fk
 FOREIGN KEY (Nazvanie)
 REFERENCES Nazvanie_books (id),
 Nomer_bilet_chitatel INT NOT NULL,
 CONSTRAINT Chitateli_Nomer_bilet_chitatel_fk
 FOREIGN KEY (Nomer_bilet_chitatel)
 REFERENCES Chitateli (Nomer_chitatelskogo_bileta),
 Shifr_book INT NOT NULL,
 CONSTRAINT Books_Shifr_book_fk
 FOREIGN KEY (Shifr_book)
 REFERENCES Books (Shifr_book),
 Date_vozvrat TIMESTAMP NOT NULL, 
 Prinyal_sotrudnik INT NOT NULL,
 CONSTRAINT Sotrudniki_Prinyal_sotrudnik_fk
 FOREIGN KEY (Prinyal_sotrudnik)
 REFERENCES Sotrudniki (id),
 Uchetnyi_god INT NOT NULL,
 CONSTRAINT Uchetnyi_god_Uchetnyi_god_fk
 FOREIGN KEY (Uchetnyi_god)
 REFERENCES Uchetnyi_god (id));

CREATE TABLE All_operacii_s_books
(id SERIAL PRIMARY KEY,
 id_vidachi INT NOT NULL,
 CONSTRAINT Vidatha_books_id_vidachi_fk
 FOREIGN KEY (id_vidachi)
 REFERENCES Vidatha_books (id),
 Vidal_sotrudnik INT NOT NULL,
 CONSTRAINT Sotrudniki_Vidal_sotrudnik_fk
 FOREIGN KEY (Vidal_sotrudnik)
 REFERENCES Sotrudniki (id),
 id_vozvrata INT NOT NULL,
 CONSTRAINT Vozvrat_books_id_vozvrata_fk
 FOREIGN KEY (id_vozvrata)
 REFERENCES Vozvrat_books (id),
 Prinyal_sotrudnik INT NOT NULL,
 CONSTRAINT Sotrudniki_Prinyal_sotrudnik_fk
 FOREIGN KEY (Prinyal_sotrudnik)
 REFERENCES Sotrudniki (id),
 Shifr_book INT NOT NULL,
 CONSTRAINT Books_Shifr_book_fk
 FOREIGN KEY (Shifr_book)
 REFERENCES Books (Shifr_book),
 Nomer_bilet_chitatel INT NOT NULL,
 CONSTRAINT Chitateli_Nomer_bilet_chitatel_fk
 FOREIGN KEY (Nomer_bilet_chitatel)
 REFERENCES Chitateli (Nomer_chitatelskogo_bileta),
 Spisanie_book varchar (255) default NULL,
 Vozmeshenie_stoimosti_book varchar (255) default NULL);
 