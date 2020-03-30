/*Create LibrabryProject database
Script date: November 12, 2017
Developed by 
Vera Yeni, 
Anirban Bhattacharjee,
Jamie Alexander,
Marc Louis Aberin
*/
use LibraryDB2
;
go

INSERT INTO Book.Author(firstName, lastName)
VALUES 
('Thomas Sterns', 'Eliot'),
('Jean', 'Baudrillard'),
('Franz', 'Kafka'), 
('James', 'Joyce'),
('George', 'Orwell'), 
('Jack', 'Kerouac'), 
('William Seward', 'Burroughs'), 
('Allen', 'Ginsberg'),
('Jean-Paul', 'Sartre'), 
('Albert', 'Camus')
;
go

INSERT INTO Book.Text(titleInEng, synopsis)
VALUES 
('Eliot: Poems', 'T. S. Elliot (1888-1965) was the dominant force in twentieth-century British and 
American poetry. With poems such as “The Love Song of J. Alfred Prufrock,” he introduced an edgy, disenchanted, 
utterly contemporary version of French Symbolism to the English-speaking world.'), 
('Simulacra and Simulation', 'Moving away from the Marxist/Freudian approaches that had concerned him earlier, 
Baudrillard developed in this book a theory of contemporary culture that relies on displacing economic notions of 
cultural production with notions of cultural expenditure.'), 
('The Trial', 'Written in 1914, The Trial is one of the most important novels of the twentieth century: the terrifying tale of Josef K., a respectable bank officer who is suddenly and 
inexplicably arrested and must defend himself against a charge about which he can get no information.'), 
('Finnegans Wake', 'In Chapelizod, a suburb of Dublin, an innkeeper and his family are sleeping. Around them and their 
dreams there swirls a vortex of world history, of ambition and failure, desire and transgression, pride and shame, 
rivalry and conflict, gossip and mystery.'), 
('Essays of George Orwell', 'The articles collected in Essays illuminate the life and work of one 
of the most individual writers of this century - a man who elevated political writing to an art. This outstanding 
collection brings together his longer, major essays and a fine selection of shorter pieces.'), 
('The Dharma Bums', 'First published in 1958, a year after On the Road put the Beat Generation on the map, The Dharma Bums stands as one of Jack Kerouacs most powerful and influential novels. The story focuses on two ebullient young Americans--mountaineer, poet, and Zen Buddhist Japhy Ryder, and Ray Smith, a zestful, innocent writer.'), 
('Junky', 'In his debut novel, Junky, Burroughs fictionalized his experiences using and peddling heroin and other drugs in the 1950s into a work that reads like a field report from the underworld of post-war America.'), 
('Howl and Other Poems ', 'Subsequently seized by U.S. customs and the San Francisco police, it was the subject 
of a long court trail at which a series of poets and professors persuaded the court that the book was not obscene.'), 
('Nausea', 'Nausea is the story of Antoine Roquentin, a French writer who is horrified at his own existence. In impressionistic, diary form he ruthlessly catalogs his every feeling and sensation.'), 
('The Stranger', 'The day his mother dies, Meursault notices that it is very hot on the bus that is taking him from 
Algiers to the retirement home where his mother lived; so hot that he falls asleep.')
;
go


INSERT INTO Book.Item(textId, title, lang, isbn, cover, numberCopies)
VALUES 
(1, 'Eliot: Poems', 'English', 1, 'H', 3), 
(2, 'Simulacra and Simulation', 'English', 500, 'P', 2), 
(3, 'The Trial', 'English', 1000, 'P', 2), 
(4, 'Finnegans Wake', 'English', 23, 'P', 3), 
(5, 'Essays of George Orwell', 'English', 321, 'H', 2),
(6, 'The Dharma Bums', 'English', 356, 'H', 1),
(7, 'Junky', 'English', 123, 'P', 1), 
(8, 'Howl and Other Poems', 'English', 23, 'H', 1),
(9, 'La nausee', 'French', 34, 'P', 2), 
(9, 'The Wall', 'English', 345, 'P', 3), 
(10, 'The Stranger', 'English', 324, 'P', 3),
(10, 'El etranjero', 'Spanish', 99, 'H', 1)
;
go

INSERT INTO Book.Copy(itemId, onLoan, loanable)
VALUES 
(1, 'Y', 'Y'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(2, 'Y', 'Y'),
(3, 'N', 'Y'),
(4, 'N', 'N'),
(4, 'Y', 'Y'),
(5, 'Y', 'Y'),
(6, 'N', 'Y'),
(6, 'Y', 'Y'),
(7, 'N', 'Y'),
(7, 'N', 'N'),
(8, 'N', 'Y'),
(9, 'Y', 'Y')
;
go

INSERT INTO Book.AuthorPerText(authorId, textId)
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10)
;
go

