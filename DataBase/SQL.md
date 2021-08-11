# SQL



- **Pandas**는 DF를 램에 저장한다. 램 영역에 저장해놓고, 가져와서 사용하는 것. 

  DB는 데이터를 Rom(하드)에 저장한다(훨씬 많은 데이터가 들어갈 수 있지).

  데이터 엄청 많을 때는, 사실 DB를 쓰는게 나음. 데이터가 500기가씩 되면 RAM에 어떻게 담을 거야. 

  데이터가 막 100TB면 이럴 때 spark같은 것을 쓰는 것. 컴퓨터에 1TB씩 100개에 나눠 저장하는 것. 

  그리고, 내 컴퓨터가 16기가라고 파이썬에서 16기가 다 쓸 수 있는 것도 아님. 이것도 따로 설정을 해야 함.

  경험상 똑같은 데이터면, DB가 더 빠르더라. 

  **참고로 파이썬은 gc가 700개가 모이면 쳐버리고 이렇게 함.**





- 테이블 생성시

  ```sql
  CREATE TABLE user1(
  	user_id INT PRIMARY KEY AUTO_INCREMENT,
  	name VARCHAR(20) NOT NULL,
  	email VARCHAR(30) UNIQUE NOT NULL,
  	age INT(3) DEFAULT '30',
  	rdate TIMESTAMP
  )
  ```

  - UNIQUE는 중복방지임. 그런데, 이렇게 하면 NULL이 하나는 들어올 수 있음. 그래서 보통, NOT NULL을 같이 써줌.

  - PRIMARY KEY는 그 자체에 UNIQUE와 NOT NULL이 동시에 들어간 상태이면서, PK를 지정한 것.  

  - **TIMESTAMP**는 데이터 안넣으면 현재 시간이 자동으로 들어가는 데이터타입. *연월일시분초* 그런데, 표준시로 되어 있을 것 보통. 서버시간이 보통 그렇게 되있음. 

  - 테이블 생성시의 인코딩은 데이터베이스의 인코딩을 따라간다. 라틴어로 되어 있네. 따로 변경을 하던가, DB자체의 인코딩을 설정해야 한다. 

    ```sql
    SHOW VARIABLES LIKE "character_set_database";
    ```

    utf 8로 바꾸려면

    ```sql
    ALTER DATABASE test CHARACTER SET = utf8;
    ```

    



- #### Data Import

  - #### Save Sample Data
    - https://dev.mysql.com/doc/index-other.html
    - world database zip 파일 다운로드
    - 압축 해제 후 world.sql 파일을 서버로 이동(CyberDuck)
    - database management app을 이용하여 world 데이터 베이스 생성
    - 데이터 저장 방법 1
    ```
    $ mysql -u root -p world < world.sql
    ```
    - 데이터 저장 방법 2
    ```
    sql> create database world;
    sql> use world;
    sql> source world.sql
    ```

  - Sakila DB

    - Sakila Data의 경우는 data와 schema를 두개 다 가지고 있음. 별개 파일. 

      schema(테이블 만들고 셋팅하는 쿼리)를 먼저 임포트 하고, 그 다음에 다시 data(데이터 넣는 쿼리)를 가지고 와야 에러가 안남.

    - *sakila database download*
       \- https://dev.mysql.com/doc/index-other.html

    - *Import sakila database*
      ` $ mysql -u root -p`
      ` sql> create database sakila; `

      `sql> quit`

    - `$ mysql -u root -p sakila < sakila-schema.sql`

    - ` $ mysql -u root -p sakila < sakila-data.sql`

