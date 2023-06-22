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

// Abrir o modal quando o botão "Adicionar Tema" for clicado
    document.getElementById('add-tema').addEventListener('click', function() {
        var myModal = new bootstrap.Modal(document.getElementById('modal-tema'));
        myModal.show();
        console.log("Abrindo Modal")
    });

// Enviar o formulário quando o botão "Adicionar Temas" for clicado
    document.getElementById('modal-tema-form').addEventListener('submit', function(e) {
        e.preventDefault(); // Impede o envio normal do formulário
        console.log("Envio Clicado")
        // Faça a requisição AJAX para enviar o formulário
        var form = this;
        var formData = new FormData(form);

        fetch(form.action, {
            method: form.method,
            body: formData
        }).then(function(response) {
            // Lógica para lidar com a resposta da requisição (por exemplo, exibir uma mensagem de sucesso)
            if (response.ok) {
                alert('Temas adicionados com sucesso!');
                var myModal = bootstrap.Modal.getInstance(document.getElementById('modal-tema'));
                myModal.hide(); // Fechar o modal após o sucesso
            } else {
                alert('Erro ao adicionar temas.');
            }
        }).catch(function(error) {
            console.error('Erro:', error);
            alert('Ocorreu um erro ao enviar o formulário.');
        });
    });


    // $('.add_theme').click(function ()
    //
    //     $('.content_theme').append('<div class="ms-2 mb-2">'+
    //         '<input type="text" id="book_add_theme_to_books_attributes_'+count_theme_on_book+'theme_name" class="form-control" value="">'+
    //         '<input autoComplete="off" type="hidden" value="2"'+
    //         'name="book[add_theme_to_books_attributes]['+count_theme_on_book+'][theme_id]"'+
    //         'id="book_add_theme_to_books_attributes_'+count_theme_on_book+'_theme_id">'+
    //     '</div>');
    //
    //     autocompleteBS([{
    //         name: 'Selecione um Tema',
    //         inputSource: document.getElementById('book_add_theme_to_books_attributes_'+count_theme_on_book+'_theme_name'),
    //         targetID: document.getElementById('book_add_author_to_books_attributes_'+count_theme_on_book+'_theme_id'),
    //         fetchURL: 'http://127.0.0.1:3000/themes.json?name={term}',
    //         fetchMap: {
    //             id: "id",
    //             name: "theme"
    //         }
    //     }]);
    //     count_authors_on_book++;
    // })
    // })


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