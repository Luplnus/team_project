// $(document).ready(function () {
//     $.getJSON("http://43.201.82.158:5000/api/musicals")
//         .done(function (data) {
//             const wrapper = $(".main-swiper .swiper-wrapper").empty();
//             data.forEach((item) => {
//                 const slide = $(`
//                  <div class="swiper-slide main-slide">
//                    <img
//                      src="http://43.201.82.158:5000/image-proxy?url=${encodeURIComponent(
//                     item.mu_poster
//                 )}"
//                      alt="${item.mu_title}"
//                      onerror="this.src='https://via.placeholder.com/240x204?text=No+Image'"
//                    />
//                  </div>
//                `);
//
//                 // 클릭 시 정보 갱신
//                 slide.click(function () {
//                     const proxyUrl = `http://43.201.82.158:5000/image-proxy?url=${encodeURIComponent(
//                         item.mu_poster
//                     )}`;
//                     $(".post_img").attr("src", proxyUrl);
//                     $(".movie_title").text(item.mu_title);
//                     $(".year").   text( formatKoreanDate(item.mu_prfpdfrom) );
//                     $(".runtime").text( formatKoreanDate(item.mu_prfpdto ) );
//                     $(".genre").text(item.mu_genre);
//                     $(".info_label").text(item.mu_venue);
//                 });
//
//                 wrapper.append(slide);
//             });
//             mainSwiper.update();
//         })
//         .fail(function (xhr, status, error) {
//             console.error("뮤지컬 데이터 로드 실패:", status, error);
//         });
// });