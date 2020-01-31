insert into member values('admin', 'aa', '관리자', sysdate, sysdate, 'none', '000-0000-0000');

insert into place(place_no,place_name,place_address,place_comment,place_cert,member_id,place_position_x, place_position_y)
                  values(place_seq.nextval,
                  '이화벽화마을',
                  '서울 종로구 이화벽화마을',
                  '이화마을은 혜화역과 동대문역 사이, 낙산공원 밑에 위치한 마을이다. Art in City 2006 이라는 큰 이름 아래 공공미술추진위원회 에서 소외된 지역의 시각적 환경을 개선하고자 낙산프로젝트 를 주관하여, 70여명의 작가가 참가하여 동네 곳곳에 그림을 그리고, 조형물을 설치했다. 가파른 계단에는 꽃 그림이 피었고, 낙산공원 산책로에는 멋진 조각들이 늘어섰다. 이 프로젝트에 참여한 작가들은 단순히 지역의 시각적 환경 개선만 한 게 아니라 동네 역사와 주민의 기억을 수집하고 정리해 작품으로 만들었다.',
                  '1',
                  'admin',37.0828630735,128.4942174981);
                  
--insert into image_url values(image_url_seq.nextval,'http://tong.visitkorea.or.kr/cms/resource/41/1954541_image2_1.jpg',1);
--insert into image_url values(image_url_seq.nextval,'http://tong.visitkorea.or.kr/cms/resource/31/1756931_image2_1.jpg',1);
--insert into image_url values(image_url_seq.nextval,'http://cfile224.uf.daum.net/image/24543C4952480F2F0197B6',1);
--insert into image_url values(image_url_seq.nextval,'http://cfile204.uf.daum.net/image/216BCD4252480F7103B9CF',1);
--insert into image_url values(image_url_seq.nextval,'http://cfile238.uf.daum.net/image/252F1A4952480F361C93AA',1);



insert into place(place_no,place_name,place_address,place_comment,place_cert,member_id,place_position_x, place_position_y)
                  values(place_seq.nextval,
                  '운악산 두부마을',
                  '경기도 가평군 운악산 두부마을',
                  '기암괴석이 곳곳에 펼쳐져 있는 계곡이 아름다운 경기 5악산 중 하나인 운악산 자락에 위치한 두부마을은 손으로 직접 빚은 손두부를 맛볼 수 있다. ',
                  '1',
                  'admin',37.0828630735,128.4942174981);
                  
--insert into image_url values(image_url_seq.nextval,'http://imgnews.naver.com/image/003/2008/05/21/NISI20080521_0006811494_web.jpg',2);
--insert into image_url values(image_url_seq.nextval,'http://cfile213.uf.daum.net/R400x0/1127693A4F1EA2821DE888',2);
--insert into image_url values(image_url_seq.nextval,'http://cfile237.uf.daum.net/R400x0/25148B4A5392B508278F68',2);
--insert into image_url values(image_url_seq.nextval,'http://woonaksan.kr/fla/index/1.jpg',2);
--insert into image_url values(image_url_seq.nextval,'http://ggtour.or.kr/wp-content/uploads/2015/08/IMG_4624-300x200.jpg',2);

insert into place(
place_no, place_name, place_address, place_comment, place_cert, member_id,place_position_x, place_position_y
) values (place_seq.nextval, '이효석 문화마을', '강원도 평창군 이효석 문화마을', '우리나라 단편문학의 백미로 일컬어지는 `메밀꽃 필 무렵의 작품무대이며, 가산 이효석 선생이 태어나 자라난 곳이다. 지난 1990년도에 문화관광부로부터 [전국 제1호 문화마을]로 지정되었으며 이곳 효석 문화마을을 배경으로 해마다 `메밀꽃 필 무렵 효석 문화제로 칭하는 축제가 늦여름 8월말 9월초 열린다. 이효석생가터, 물레방앗간, 충주집, 가산공원, 이효석기념관, 메밀향토자료관 등이 있으며, 소설 속 배경 그대로 메밀꽃이 산허리를 휘감고 돌며 피어난다. 매년 초가을에 개최되는 효석문화제는 문학과 메밀을 소재로 한 다채로운 볼거리 제공한다.', '1', 'admin',37.0828630735,128.4942174981);

insert into place(
place_no, place_name, place_address, place_comment, place_cert, member_id,place_position_x, place_position_y
) values (place_seq.nextval, '경주세계문화엑스포공원', '경상북도 경주시 경주세계문화엑스포공원', '경주세계문화엑스포는 반만년 유구한 문화가 응축돼 있는 ‘지붕 없는 박물관’ 경주에서 한국인의 문화 자긍심을 드높이고, 민족문화와 세계문화의 접목을 통해 인류문화 발전에 기여하고자 경상북도가 지난 1996년에 조직했다. 영국이 산업박람회를 통해 20세기 산업사회를 이끌었듯 경주세계문화엑스포는 문화엑스포를 통해 21세기 문화 아이콘을 선점하겠다는 목표로 미래 인류문명이 나아가야 할 좌표를 탐색하고, 지역과 국가 경쟁력을 높여가겠다는 포부를 갖고 있다.', '1', 'admin',37.0828630735,128.4942174981);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile217.uf.daum.net/image/16191C394DE565292E1A0B', 3);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://asiaenglish.visitkorea.or.kr/cms/resource/48/181148_image2_1.jpg', 3);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile214.uf.daum.net/image/1414063A4DE5652B30383A', 3);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://firstpension.penbang.com/webnote/upload/_quick/2015/_3d262d031235ea1_143832317015375608.jpg', 3);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile235.uf.daum.net/image/2405084553A23BBF0E8A1C', 3);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.ttearth.com/world/asia/korea/gyeongju/img/gyeongju_expo_park/gyeongju_expo_park00.jpg', 4);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile208.uf.daum.net/image/203ED14B4E4A23CA34BA65', 4);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile225.uf.daum.net/image/1768043D4E4D0A0605B903', 4);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.yeongnam.com/Photo/2015/08/26/L20150826.99001113934485302.jpeg', 4);

insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://i1.daumcdn.net/thumb/R750x0/?fname=http%3A%2F%2Fcfile27.uf.tistory.com%2Fimage%2F274D65385432BFA019666A', 4);

insert into place (place_no, place_name, place_address, place_comment, place_cert, member_id,place_position_x, place_position_y)
values(place_seq.nextval, '압록유원지', '전남 곡성군 압록유원지', 
'섬진강과 보성강이 합류한 기점인 이 곳은 3만여 평의 드넓은 백사장이 펼쳐져있는 한여름 피서지로 널리 알려진 자연유원지다.여름에는 모기가 없어 가족단위 캠핑장소로 각광을 받고 있으며, 반월교와 철교가 나란히 강을 가로질러 놓여있어 운치가 뛰어나다. 특히,보성강 하류에 유명 낚시터가 산재해있어 강태공들에게는 인기가 높다. 강변에는 압록의 별미인 참게탕, 은어구이, 매운탕을 맛볼 수 있는 향토음식점이 즐비해 있어 또다른 즐거움을 준다.',
1,'admin',37.0828630735,128.4942174981);

insert into place (place_no, place_name, place_address, place_comment, place_cert, member_id,place_position_x, place_position_y)
values(place_seq.nextval, '조동산촌마을', '충북 영동군 조동산촌마을', 
'살기좋은 산촌마을 및 즐거운 휴식공간 제공을 위하여 1995년부터 조성하기 시작한 용화면 조동리 일원의 산촌마을은 상하수도 및 주택 개량 등으로 깨끗한 정주 환경 속에 민주지산, 각호산, 천마산 자락속에 깊은 계곡과 맑은 물, 다양한 휴식공간과 넉넉한 인심이 넘치고 산간오지에서 생산된 버섯, 산채, 약초, 호도, 포도 등 자연산 신토불이 토종특산물이 있는 곳이다.',
1,'admin',37.0828630735,128.4942174981);



insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://tong.visitkorea.or.kr/cms/resource/26/1606726_image2_1.jpg', 5);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile208.uf.daum.net/image/1959440D4BD3B4522FDC64', 5);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://cfile235.uf.daum.net/image/1731F24B4E2D31CA2C472A', 5);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.penews.kr/news/photo/201402/3625_1984_1318.jpg', 5);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.zerook.com/data/cheditor4/1312/cd2c66ef779b9491a21a9ebb7891c159_1387977661.3.jpg', 5);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.zerook.com/data/cheditor4/1312/cd2c66ef779b9491a21a9ebb7891c159_1387977906.44.jpg', 6);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.zerook.com/data/cheditor4/1312/cd2c66ef779b9491a21a9ebb7891c159_1387977907.2.jpg', 6);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.zerook.com/data/cheditor4/1312/cd2c66ef779b9491a21a9ebb7891c159_1387977907.83.jpg', 6);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.zerook.com/data/cheditor4/1312/cd2c66ef779b9491a21a9ebb7891c159_1387977908.43.jpg', 6);
insert into image_url(
image_url_no, image_url_url,place_no
) values (image_url_seq.nextval, 'http://www.zerook.com/data/cheditor4/1312/cd2c66ef779b9491a21a9ebb7891c159_1387977908.05.jpg', 6);

insert into big_group values(big_group_seq.nextval, '지역별');
insert into big_group values(big_group_seq.nextval, '테마별');
insert into big_group values(big_group_seq.nextval, '기간별');
insert into big_group values(big_group_seq.nextval, '맛집');


insert into group_detail values(group_detail_seq.nextval, '서울', 1);
insert into group_detail values(group_detail_seq.nextval, '경기', 1);
insert into group_detail values(group_detail_seq.nextval, '강원', 1);
insert into group_detail values(group_detail_seq.nextval, '경상', 1);
insert into group_detail values(group_detail_seq.nextval, '전라', 1);
insert into group_detail values(group_detail_seq.nextval, '충청', 1);
insert into group_detail values(group_detail_seq.nextval, '제주', 1);

insert into group_detail values(group_detail_seq.nextval, '가족여행', 2);
insert into group_detail values(group_detail_seq.nextval, '우정여행', 2);
insert into group_detail values(group_detail_seq.nextval, '커플여행', 2);
insert into group_detail values(group_detail_seq.nextval, '단체여행', 2);

insert into group_detail values(group_detail_seq.nextval, '당일', 3);
insert into group_detail values(group_detail_seq.nextval, '1박2일', 3);
insert into group_detail values(group_detail_seq.nextval, '2박3일', 3);
insert into group_detail values(group_detail_seq.nextval, '맛집', 4);


insert into place_grouping values(place_grouping_seq.nextval, 1, 1);
insert into place_grouping values(place_grouping_seq.nextval, 1, 10);
insert into place_grouping values(place_grouping_seq.nextval, 1, 12);

insert into place_grouping values(place_grouping_seq.nextval, 2, 2);
insert into place_grouping values(place_grouping_seq.nextval, 2, 8);
insert into place_grouping values(place_grouping_seq.nextval, 2, 13);

insert into place_grouping values(place_grouping_seq.nextval, 3, 3);
insert into place_grouping values(place_grouping_seq.nextval, 3, 8);
insert into place_grouping values(place_grouping_seq.nextval, 3, 14);

insert into place_grouping values(place_grouping_seq.nextval, 4, 4);
insert into place_grouping values(place_grouping_seq.nextval, 4, 10);
insert into place_grouping values(place_grouping_seq.nextval, 4, 13);

insert into place_grouping values(place_grouping_seq.nextval, 5, 5);
insert into place_grouping values(place_grouping_seq.nextval, 5, 8);
insert into place_grouping values(place_grouping_seq.nextval, 5, 14);

insert into place_grouping values(place_grouping_seq.nextval, 6, 6);
insert into place_grouping values(place_grouping_seq.nextval, 6, 11);
insert into place_grouping values(place_grouping_seq.nextval, 6, 12);
