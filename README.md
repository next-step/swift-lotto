## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

### [2단계] 로또(2등) 구현 방법
1. 보너스 번호를 입력받는다.
    - InputView에 보너스 번호를 입력받는 메서드(`readBonusNumber()`) 추가함  
1. WinningLotto 구조체를 만들어 bonus number를 갖는 당첨 로또를 나타내도록 했다.
    - WinningLotto와 기존의 로또(DefaultLotto)는 Lotto 프로토콜을 따른다.
    - Lotto 프로토콜은 `numbers: Set<Int>` 프로퍼티와 다른 로또와 일치하는 번호 개수를 반환하는 `equalNumberCount(with lotto: Lotto) -> Int` 메서드를 갖는다.  
    -> 따라서 모든 Lotto는 숫자 집합을 가지며, 다른 로또와 비교할 수 있도록 만들었다.
2. LottoParser에서 당첨번호(String) 보너스 번호(String)을 받아서 WinningLotto를 반환하는 메서드(`parseWinningLotto()`)를 구현   
4. WinningCount를 힌트로 주어진 Rank로 수정했다.
5. WinningRecord의 intializer에서 bonus번호도 받을 수 있도록 수정했다.
    - typealias를 사용하여 (당첨숫자, 보너스번호 일치여부) tuple를 inialzier 파라미터로 받는다.

6. **TicketBag에서 WinningRecord를 생성할 때, (당첨숫자, 보너스번호 일치여부) 를 생성한다**
    - 다른 로또가 WiningLotto의 보너스 번호를 갖고 있는지 여부(Bool)을 반환하는 `checkBonusNumber(in:)`메서드를 WinningLotto에 구현 
    

### 프로그래밍 요구사항
1. 사용자의 입력을 받는다.
    - 구매 금액을 입력받는다.
2. 발급할 로또 개수를 계산한다.
3. 발급한 로또 개수를 출력한다.
4. 발급한 로또를 출력한다.
5. 지난 주 당첨 번호를 입력받는다.
6. 당첨 통계를 출력한다.
    - 3개 일치 (5000원)- 1개
    - 4개 일치 (50000원)- 0개
    - 5개 일치 (1500000원)- 0개
    - 6개 일치 (2000000000원)- 0개
7. 수익률을 계산한다.
8. 수익률을 출력한다.

### 역할 분배
1. InputView : 사용자로부터 입력을 받는다.
    - 구매 금액을 입력받는다.
    - 지난 주 당첨 번호를 입력받는다.
3. MoneyParser: 사용자로부터 받은 금액 문자열을 Money인스턴스로 파싱한다.
4. LottoParser: 사용자로부터 받은 로또 문자열을 Lotto인스턴스로 파싱한다.
5. Casher: 사용자가 입력한 금액을 받아서, LottoTicketMachine을 이용하여 LottoTicket을 출력한다.
    - LottoTicketMachine: LottoFactory를 이용하여 여러개의 Lotto를 갖는 LottoTicket을 생성한다.
    - LottoFactory: LottoNumberGenerator를 이용하여 여러개의 LottoNumber를 생성하고, 이것을 묶어 Lotto를 생성한다.
    - LottoNumberGenerator: LottoNumber 생성기
6. LottoTicket: Lotto 여러개를 담고 있는 일급 컬렉션, 당첨 로또(WinningLotto)를 입력받아서 당첨 통계(WinningRecord)를 계산하는 역할을 한다.
    - Lotto: LottoNumber(로또 넘버)를 담는 일급 컬렉션, 다른 로또와 일치하는 LottoNumber의 개수를 계산하는 역할을 한다.
    - LottoNumber: 로또 숫자 하나를 나타낸다.
7. LottoTicketFormatter: LottoTicket 인스턴스를 출력할 문자열로 변환한다.
8. WinningRecordFormatter: WinningRecord인스턴스를 출력할 문자열로 변환한다. 
