$(document).ready(function (){

    $('.add_author').click(function(){

       $('.content_authors').append('<div class="ms-2 mb-2">'+
            '<input type="text" id="book_add_author_to_books_attributes_'+count_authors_on_book+'_author_name" class="form-control" value="">'+
                '<input autoComplete="off" type="hidden" value="2"'+
                       'name="book[add_author_to_books_attributes]['+count_authors_on_book+'][author_id]"'+
                       'id="book_add_author_to_books_attributes_'+count_authors_on_book+'_author_id">'+
        '</div>');
        autocompleteBS([{
                    name: 'Selecione um author',
                    inputSource: document.getElementById('book_add_author_to_books_attributes_'+count_authors_on_book+'_author_name'),
                    targetID: document.getElementById('book_add_author_to_books_attributes_'+count_authors_on_book+'_author_id'),
                    fetchURL: 'http://127.0.0.1:3000/authors.json?name={term}',
                    fetchMap: {
                        id: "id",
                        name: "signature"
                    }
                }]);
       count_authors_on_book++;
    })
    // if($("#search_author").length > 0)
    //     autocompleteBS([{
    //         name: 'Select A Country by Name',
    //         inputSource: document.getElementById('search_author'),
    //         targetID: document.getElementById('book_author_id'),
    //         fetchURL: 'http://127.0.0.1:3000/authors.json?name={term}',
    //         fetchMap: {
    //             id: "id",
    //             name: "signature"
    //         }
    //     }]);
})