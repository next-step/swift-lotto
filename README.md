## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

---
## 목차
1. [로또(자동) 파일트리](#1-로또(자동)-파일트리)
2. [구현 기능 목록](#2-구현-기능-목록)
---

## 1. 로또(자동) 파일트리
```
Lotto
├── model
│   ├── Constants.swift
│   └── Lotto.swift
│   └── LottoReward.swift
│   └── Match.swift
└── view
    ├── InputView.swift
    └── ResultView.swift  
├── controller
│   ├── LottoGenerator.swift
├── main.swift
```

    
## 2. 구현 기능 목록
- **Constants**
    - `lottoPrice`: 로또 한장 가격
    - `defaultLottoRange`: 로또 번호 생성 범위
    - `defaultLottoCount`: 로또 당첨 번호 갯수

- **Lotto**
    - `LottoNumber`: 로또가 가질 수 있는 숫자 타입 일급 콜렉션
    - `LottoNumbers`: 로또번호 6개 생성을 위한 일급 콜렉션
    - `WinnerLotto`: 로또 당첨번호(+보너스 번호) 일급 콜렉션
    - `Lotto`: 로또 한개를 나타내는 일급 콜렉션
    - `Lotttos`: 로또 여러개를 나타내는 일급 콜렉션

- **LottoGenerator**
    - `randomNumber()`: 랜덤 숫자 생성
    - `autoNumbers()`: 랜덤 숫자 6개 생성 후 Lotto 리턴
    - `auto(n:)`: n개의 로또 생성 후 Lottos 리턴
    - `purchase(manualLottos:autoCount:)`: autoCount에 따른 자동 로또 구매 및 수동 로또와 합쳐서 리턴


- **InputView**
    - `readPurchasePrice()`: 구매할 로또 금액 입력받아서 구매 개수(Int) 리턴
    - `readManualCount(purchaseCount:)`: 수동으로 구매할 로또 갯수(Int) 리턴
    - `readManualNumbers(count:)`: count만큼 수동 로또 번호 입력받아서 리턴
    - `readPrevWinningNumber()`: 로또 당첨 번호 입력받아서 [Int] 리턴
    - `readBonusNumber(winningNumbers:)`: 보너스 번호를 입력받아서 Int 리턴


- **ResultView**
    - `printPurchaseMessage(manual:auto:)`: 수동/자동 구매 갯수 출력
    - `printLottoNumbers(lotto:)`: 로또 번호 출력
    - `printLottos(lottos:)`: 로또 번호들 출력
    - `printResult(lottos:winningLotto:)`: 1~5등 추첨 결과 및 수익률 출력
