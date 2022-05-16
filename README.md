## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

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
