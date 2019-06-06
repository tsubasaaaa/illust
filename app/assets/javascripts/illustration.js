$(function(){

  var search_list = $(".search-list");
  function appendIllustration(illustration){
    var insertImage = `<img src="${illustration.image}">`
    var html = `<div class="search-list__one >
                  <div class="search-list__one__title" >
                    ${illustration.title}
                  </div>
                  <div class="search-list__one__text" >
                    ${illustration.text}
                  </div>
                  ${insertImage}
                </div>`
    search_list.append(html)
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class="search-list__one" >
                  ${msg}
                </div>`
    search_list.append(html);
  }
  $('#search-field').on("keyup", function(){
    var input = $("#search-field").val();
    // console.log(input)
    $.ajax({
      type: 'GET',
      url: '/illustrations/search_list',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(illustrations){
      $(".search-list").empty();
      console.log(illustrations)
      if (illustrations.length !== 0 ) {
        illustrations.forEach(function(illustration){
          appendIllustration(illustration);
        });
      }
      else {
        appendErrMsgToHTML("一致するユーザーはいません");
      }
    })
    .fail(function(){
      alert('errorです');
    });
  });
});

/* <img src="${illustration.image}", class="search-list__one__image"></img> */