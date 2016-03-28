function returnFromDB() {
    var db = LocalStorage.openDatabaseSync("f", "1.0", "Baza z jedzeniem", 1000000);
    db.transaction(
                function(tx) {
                    // Create the database if it doesn't already exist
                    tx.executeSql('CREATE TABLE IF NOT EXISTS foods_table(nazwa TEXT, opis TEXT, przepis TEXT, typ TEXT, obrazek TEXT)');

                    // Show all
                    var rs = tx.executeSql('SELECT * FROM foods_table'); // WHERE nazwa LIKE \'%lazaniassxx%\'


                    if(rs.rows.length < 1){
                        function exe(command, command1){
                            tx.executeSql(command, command1)
                        }
                        // nazwa, opis, przepis, typ, obrazek
                        //////////////////////////////////////////////////////////////////////////////////
                        exe('INSERT INTO foods_table VALUES(?, ?, ?, ?, ?)', [ 'Lazania',
                                                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                                                                              'sniadanie',
                                                                              'lazania.jpg']);

                        exe('INSERT INTO foods_table VALUES(?, ?, ?, ?, ?)', [ 'Lazaniaddd',
                                                                              'to jestwe opis',
                                                                              'to jest prazepis',
                                                                              'obiad',
                                                                              'lazania.jpg']);

                        exe('INSERT INTO foods_table VALUES(?, ?, ?, ?, ?)', [ 'Lazaniass',
                                                                              'to jest opids',
                                                                              'to jest przepdis',
                                                                              'kolacja',
                                                                              'lazania.jpg']);

                        exe('INSERT INTO foods_table VALUES(?, ?, ?, ?, ?)', [ 'Lazaniassxxx',
                                                                              'to jest opids',
                                                                              'to jest przepdis',
                                                                              'sniadanie',
                                                                              'lazania.jpg']);

                        exe('INSERT INTO foods_table VALUES(?, ?, ?, ?, ?)', [ 'Lazaniazss',
                                                                              'to jest opids',
                                                                              'to jest przepdis',
                                                                              'obiad',
                                                                              'lazania.jpg']);
                        //////////////////////////////////////////////////////////////////////////////////
                        returnFromDB();
                    }

                    for(var i = 0; i < rs.rows.length; i++) {
                        myModel.append({
                                           "nazwa": rs.rows.item(i).nazwa,
                                           "opis": rs.rows.item(i).opis,
                                           "przepis": rs.rows.item(i).przepis,
                                           "typ": rs.rows.item(i).typ,
                                           "obrazek": rs.rows.item(i).obrazek
                                       })
                    }
                }
                )
}
