## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

## 1단계. 문자열 덧셈 계산기

### 요구 사항

- 숫자를 쉼표(,) 또는 콜론(:)을 구분해서 입력할 수 있다.
- 쉼표(,) 또는 콜론(:)으로 구분한 값들은 0 을 포함한 양의 정수이다.
- 쉼표(,) 또는 콜론(:)으로 구분한 숫자를 더할 수 있다.

### 예외 케이스

- 입력값이 nil 로 들어오는 경우
- 입력값이 "" 로 들어오는 경우
- 쉼표(,) 또는 콜론(:)으로 구분한 값이 0 또는 양의 정수가 아닌 경우

## 2단계. 로또(자동)

### 기능 요구사항

- 로또 구입 금액을 입력할 수 있다.
  - 한장의 가격이 1000원이기 때문에, 1000원 이상이어야 한다.
  - 1000원 단위로 나누어 떨어져야 한다
- 구입 금액에 해당하는 로또를 발급할 수 있다.
  - 각 로또는 여섯개의 번호를 가진다. 
  - 번호는 1과 45 사이의 번호이다
  - 번호는 중복될 수 없다.
- 지난 주 당첨 번호 여섯개를 입력할 수 있다. 
  - 각 당첨 번호는 , 로 구분된다.
  - 번호는 1과 45 사이의 번호이다.
- 당첨 통계를 출력할 수 있다
  - 3개 ~ 6개 번호를 맞춘 로또가 각각 몇개인지 당첨 금액과 함께 출력한다 
  - 총 수익률을 출력한다.

## 3단계. 로또 (2등)

### 기능 요구사항

- 2등을 위한 보너스 번호를 입력 받을 수 있다
  - 번호는 1과 45 사이의 번호이다
  - 번호는 이전 번호들과 중복될 수 없다
- 2등을 포함해서 당첨 통계를 출력할 수 있다.