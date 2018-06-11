# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

eventnames = [
    '기획/아이디어',
    '광고/마케팅',
    '사진/영상/UCC',
    '디자인/순수미술/공예',
    '네이밍/슬로건',
    '캐릭터/만화/게임',
    '건축/건설/인테리어',
    '과학/공학',
    '예체능/패션',
    '전시/페스티벌',
    '문학/시나리오',
    '해외',
    '학술',
    '창업',
    '기타'
]

eventnames.each do |x|
    Eventcate.create(name: x) # 희망 공모전
end

interestname = [
    'B2B서비스',
    '빅데이터',
    '커머스',
    '보안',
    '대중교통',
    '인공지능',
    '로봇',
    '자동차',
    '드론',
    '디자인',
    '에너지',
    '우주항공',
    '교육',
    '생산성',
    '소셜',
    '미디어',
    '건강/헬스케어',
    '음식',
    '블록체인',
    '비트코인',
    '엔터테인먼트',
    '커뮤니티',
    '패션',
    '금융',
    '여행',
    '게임',
    '라이프스타일',
    '예술',
    '바이오테크',
    '의료',
    '정치',
    '법',
    '행정',
    'O2O',
    '사물인터넷',
    'IT 솔루션',
    'IT 서비스'
]

interestname.each do |x|
    Interestcate.create(name: x) # 관심 분야
end

workname = [
    '개발자',
    '마케터',
    '디자이너',
    '기획자'
]
    
workname.each do |x|
    Workcate.create(name: x) # 직무 
end

profname = [
    'C','C#','JAVA', 'Python', 'Ruby', 'Css', 'Html', 'Django', 'Javascript', 'Jquery', 'AngularJS', 'PHP', 'iOS', 'Swift', 'Android',
    '웹 서비스', '모바일 서비스', '그래픽', '일러스트', '게임', '모바일 디자인', '웹 디자인', '기획', '마케팅', '백앤드 개발', '프론트앤드 개발', 'UX',
    '프로젝트 관리', '영업', '광고', '마케팅', '데이터 분석', '제품 디자인', '하드웨어', '임베디드SW', '임베디드OS',
    'Arduino', 'Rails', 'AWS', 'Mysql', 'React', '제2외국어', '뉴미디어', '스토리/시나리오 작성', '영어', '중국어', '일본어',
    '머신러닝', 'Git', 'Assembly', '블록체인', '사운드 엔지니어링', 'React Native', 'Vue JS', '영상 촬영/편집', '사진 촬영/편집'
    ]
    
profname.each do |x|
    Profcate.create(name: x) # 전문기술
end

