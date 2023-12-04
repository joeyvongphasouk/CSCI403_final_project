"""
You will need to install the 'pg8000' library using pip. See the Assignment description in
Canvas for instructions on how to do this. 'getpass' is a builtin library that you do not
need to install.
"""
import pg8000
import getpass

# imports for type annotations
from pg8000 import Connection, Cursor
from typing import List, Tuple, Optional

###########################################
## MAKE YOUR EDITS BELOW (see the TODOs) ##
###########################################

# Things to keep in mind:
# 1. We are using the 'dbapi' interface to pg8000, as described here:
#      https://github.com/tlocke/pg8000#db-api-2-docs
# 2. You will need to use the 'cursor' object to execute queries.
# 3. Don't forget to create the tables and insert the data from the lab7setup.sql file!
# 4. Don't forget to get a new cursor from the connection for each query
# 5. Don't forget to commit your changes to the database after each update
# 6. Don't forget to rollback your changes if an error occurs
# 7. Make sure your personal schema is at the beginning of your search path


def search_by_artist(db: Connection, search_string: str) -> List[Tuple[str, str, str, str]]:
    """
    Searches for albums by artist name. Returns a list of tuples, where each tuple
    represents an album. Each tuple contains 4 elements: artist name, album title,
    album year, and album id. If no albums are found, returns an empty list.
    """
    # remember to get a new cursor from the connection for each query
    cursor = db.cursor()

    query = """SELECT ar.name, al.title, al.year, al.id 
               FROM artist AS ar, album AS al
               WHERE lower(ar.name) LIKE lower(%s)
               AND ar.id = al.artist_id
               ORDER BY ar.name, al.year, al.title"""

    # wraps our search string in %'s to allow for partial matches
    search_string = '%' + search_string + '%'

    try:
        # execute the query, passing in the search string as a parameter
        cursor.execute(query, (search_string, ))

        # fetch all the results
        resultset = cursor.fetchall()
        return resultset

    except pg8000.Error as e:
        # if there is an error, print it out and return None
        print("Database error\n")
        return []


def search_by_album(db: Connection, search_string: str) -> List[Tuple[str, str, str, str]]:
    """
    Searches for albums by album title. Returns a list of tuples, where each tuple
    represents an album. Each tuple contains 4 elements: artist name, album title,
    album year, and album id. If no albums are found, returns an empty list.
    """

    cursor = db.cursor()

    query = """SELECT ar.name, al.title, al.year, al.id 
               FROM artist AS ar, album AS al
               WHERE lower(al.title) LIKE lower(%s)
               AND ar.id = al.artist_id
               ORDER BY ar.name, al.year, al.title"""
    
    search_string = '%' + search_string + '%'
    
    try:
        cursor.execute(query, (search_string, ))
        resultset = cursor.fetchall()
        return resultset

    except pg8000.Error as e:
        print("Database error\n")
        return []

def insert_artist(db: Connection, artist_name: str):
    """
    Inserts a new artist into the database. Does not return anything.
    """
    cursor = db.cursor()
    
    query = """INSERT INTO artist (name) VALUES (%s)"""

    try:
        cursor.execute(query, (artist_name, ))
        db.commit()
        print(f"Save new artist {artist_name}")

    except pg8000.Error as e:
        db.rollback()
        print(f"Database error: {e}\n")



def insert_album(db: Connection, album_name: str, year: str, artist_name: str):
    """
    Inserts a new album with the given name, year, and artist name into the database.
    Does not return anything.
    """
    cursor = db.cursor()

    # find artist id
    query = "SELECT id FROM artist WHERE name = (%s)"

    query2 = """INSERT INTO album (artist_id, title, year)
                VALUES (%s, %s, %s)"""
    try:
        cursor.execute(query, (artist_name, ))
        
        artist_id = cursor.fetchone()
        if not artist_id:
            raise pg8000.Error("Invalid")

        cursor.execute(query2, (artist_id, album_name, year))
        db.commit()
        print('Save new album: ' + artist_name + ' - ' + album_name + ' (' + year + ')')
    except pg8000.Error as e:
        db.rollback()
        print("Artist does not exist or duplicate album.")
        print('Details: ' + artist_name + ' - ' + album_name + ' (' + year + ')')
        print(e)


def update_album(db: Connection, album_id: str, album_name: str, year: str):
    """
    Updates the album with the given id to have the given name and year. Does not return anything.
    """
    cursor = db.cursor()

    query = "UPDATE album SET title = %s, year = %s WHERE id = %s"
    try:
        cursor.execute(query, (album_name, year, album_id))
        db.commit()
        print('Update album: ' + str(album_id) + ': ' + album_name + ' (' + year + ')')
    except pg8000.Error as e:
        db.rollback()
        print("Album does not exist (invalid album id), or not properly implemented.")
        print('Details: ' + album_id + ' - ' + album_name + ' (' + year + ')')
        print(e)


def delete_album(db: Connection, album_id: str):
    """
    Deletes the album with the given id. Does not return anything.
    """
    cursor = db.cursor()
    query = "DELETE FROM album WHERE id = %s"
    try:
        cursor.execute(query, (album_id, ))
        db.commit()
        print('Delete album: ' + str(album_id))
    except pg8000.Error as e:
        db.rollback()
        print("Album does not exist (invalid album id), or not properly implemented.")
        print('Details: ' + album_id)
        print(e)


def get_artists(db: Connection) -> List[str]:
    """
    Returns a list of all artist names in the database.
    """
    cursor = db.cursor()
    query = "SELECT name FROM artist"
    try:
        cursor.execute(query)
        name_list = []
        for row in cursor.fetchall():
            name_list.append(row[0])
        return name_list
    except pg8000.Error as e:
        db.rollback()
        print(f"Database error: {e}")
        return []

###########################################
## Make YOUR EDITS ABOVE (see the TODOs) ##
## Do NOT edit below this line           ##
###########################################


def print_albums(albums: List[Tuple[str, str, str, str]]):
    """
    Prints the given list of albums with some formatting.
    """
    if len(albums) == 0:
        print('No albums found.')
        return
    for row in albums:
        # row is a tuple with 4 elements: artist name, album title, album year, and album id
        artist, album, year, album_id = row
        # pad the fields so they are all the same length
        print('  ' + artist.ljust(20) + ' - ' + album.ljust(30) + ' (' + str(year) + ') id: ' + str(album_id))


def print_artists(artists: List[str]):
    """
    Prints the given list of artists with some formatting.
    """
    if len(artists) == 0:
        print('No artists found.')
        return
    for artist in artists:
        print('  ' + artist)


def get_connection() -> Optional[Connection]:
    """
    Creates a connection to the database
    """
    # get the username and password
    username = input('Username: ')
    password = getpass.getpass('Password: ')

    # connect to the database
    credentials = {
        'user': username,
        'password': password,
        'database': 'csci403',
        'port': 5433,
        'host': 'codd.mines.edu'
    }
    try:
        db = pg8000.connect(**credentials)
        # do not change the autocommit line below or set autocommit to true in your solution
        # this lab requires you add appropriate db.commit() calls
        db.autocommit = False
    except pg8000.Error as e:
        print(f'Authentication failed for user "{username}" (error: {e})\n')
        return None

    return db


def search(db: Connection):
    """
    Searches for albums by artist or album name.
    """
    while True:
        choice = input('Search by Artist (A) or Album (L)?: ')
        if choice == 'A' or choice == 'a':
            search_str = input('Enter artist name: ')
            print_albums(search_by_artist(db, search_str))
            break
        elif choice == 'L' or choice == 'l':
            search_str = input('Enter album name: ')
            print_albums(search_by_album(db, search_str))
            break
        else:
            print('Invalid choice. Try again.')
        print(' ')


def insert(db: Connection):
    """
    Inserts new albums or artists into the database.
    """
    while True:
        choice = input('Insert Artist (R) or Album (L)?: ')
        if choice == 'R' or choice == 'r':
            name = input('Enter Artist name: ')
            insert_artist(db, name)
            break
        elif choice == 'L' or choice == 'l':
            al_name = input('Enter Album name: ')
            year = input('Enter Album year: ')
            ar_name = input('Enter Artist name: ')
            insert_album(db, al_name, year, ar_name)
            break
        else:
            print('Invalid choice. Try again.')
        print(' ')


def update(db: Connection):
    """
    Updates an album in the database.
    """
    al_id = input('Enter Album id: ')
    al_name = input('Enter NEW Album name: ')
    al_year = input('Enter NEW Album year: ')
    update_album(db, al_id, al_name, al_year)


def delete(db: Connection):
    """
    Deletes an album from the database.
    """
    al_id = input('Enter Album id: ')
    delete_album(db, al_id)


def cli():
    """
    Runs the command line interface.
    """
    # connect to the database. Loop until we get a db object.
    # This tells us that the user has successfully logged in.
    while True:
        db = get_connection()
        if db is not None:
            break

    # main loop
    while True:
        choice = input('Search (S)\nInsert (I)\nUpdate (U)\nDelete (D)\nGet Artists (G)\nQuit (Q)\n> ')
        if choice == 'S' or choice == 's':
            search(db)
        elif choice == 'I' or choice == 'i':
            insert(db)
        elif (choice == 'U' or choice == 'u'):
            update(db)
        elif (choice == 'D' or choice == 'd'):
            delete(db)
        elif (choice == 'G' or choice == 'g'):
            print_artists(get_artists(db))
        elif (choice == 'Q' or choice == 'q'):
            print(" ")
            break
        else:
            print("Invalid choice. Try again.")
        print(" ")



if __name__ == '__main__':
    cli()
