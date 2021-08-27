require('dotenv').config();
const abi = [
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "offerId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "collateralId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "offerOwner",
        "type": "address"
      }
    ],
    "name": "CancelOfferEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "packageId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "enum PawnContract.PawnShopPackageStatus",
        "name": "status",
        "type": "uint8"
      }
    ],
    "name": "ChangeStatusPawnShopPackage",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "contractId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "liquidedAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "feeAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "enum PawnContract.ContractLiquidedReasonType",
        "name": "reasonType",
        "type": "uint8"
      }
    ],
    "name": "ContractLiquidedEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "collateralId",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
          },
          {
            "internalType": "address",
            "name": "collateralAddress",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "loanAsset",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "expectedDurationQty",
            "type": "uint256"
          },
          {
            "internalType": "enum PawnContract.LoanDurationType",
            "name": "expectedDurationType",
            "type": "uint8"
          },
          {
            "internalType": "enum PawnContract.CollateralStatus",
            "name": "status",
            "type": "uint8"
          }
        ],
        "indexed": false,
        "internalType": "struct PawnContract.Collateral",
        "name": "data",
        "type": "tuple"
      }
    ],
    "name": "CreateCollateralEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "offerId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "collateralId",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "repaymentAsset",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "loanAmount",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "interest",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "duration",
            "type": "uint256"
          },
          {
            "internalType": "enum PawnContract.OfferStatus",
            "name": "status",
            "type": "uint8"
          },
          {
            "internalType": "enum PawnContract.LoanDurationType",
            "name": "loanDurationType",
            "type": "uint8"
          },
          {
            "internalType": "enum PawnContract.LoanDurationType",
            "name": "repaymentCycleType",
            "type": "uint8"
          },
          {
            "internalType": "uint256",
            "name": "liquidityThreshold",
            "type": "uint256"
          },
          {
            "internalType": "bool",
            "name": "isInit",
            "type": "bool"
          }
        ],
        "indexed": false,
        "internalType": "struct PawnContract.Offer",
        "name": "data",
        "type": "tuple"
      }
    ],
    "name": "CreateOfferEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "packageId",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          },
          {
            "internalType": "enum PawnContract.PawnShopPackageStatus",
            "name": "status",
            "type": "uint8"
          },
          {
            "internalType": "enum PawnContract.PawnShopPackageType",
            "name": "packageType",
            "type": "uint8"
          },
          {
            "internalType": "address",
            "name": "loanToken",
            "type": "address"
          },
          {
            "components": [
              {
                "internalType": "uint256",
                "name": "lowerBound",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "upperBound",
                "type": "uint256"
              }
            ],
            "internalType": "struct PawnContract.Range",
            "name": "loanAmountRange",
            "type": "tuple"
          },
          {
            "internalType": "address[]",
            "name": "collateralAcceptance",
            "type": "address[]"
          },
          {
            "internalType": "uint256",
            "name": "interest",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "durationType",
            "type": "uint256"
          },
          {
            "components": [
              {
                "internalType": "uint256",
                "name": "lowerBound",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "upperBound",
                "type": "uint256"
              }
            ],
            "internalType": "struct PawnContract.Range",
            "name": "durationRange",
            "type": "tuple"
          },
          {
            "internalType": "address",
            "name": "repaymentAsset",
            "type": "address"
          },
          {
            "internalType": "enum PawnContract.LoanDurationType",
            "name": "repaymentCycleType",
            "type": "uint8"
          },
          {
            "internalType": "uint256",
            "name": "loanToValue",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "loanToValueLiquidationThreshold",
            "type": "uint256"
          }
        ],
        "indexed": false,
        "internalType": "struct PawnContract.PawnShopPackage",
        "name": "data",
        "type": "tuple"
      }
    ],
    "name": "CreatePawnShopPackage",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "contractId",
        "type": "uint256"
      }
    ],
    "name": "LoanContractCompletedEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "address",
        "name": "fromAddress",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "contractId",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "collateralId",
            "type": "uint256"
          },
          {
            "internalType": "int256",
            "name": "offerId",
            "type": "int256"
          },
          {
            "internalType": "int256",
            "name": "pawnShopPackageId",
            "type": "int256"
          },
          {
            "components": [
              {
                "internalType": "address",
                "name": "borrower",
                "type": "address"
              },
              {
                "internalType": "address",
                "name": "lender",
                "type": "address"
              },
              {
                "internalType": "address",
                "name": "collateralAsset",
                "type": "address"
              },
              {
                "internalType": "uint256",
                "name": "collateralAmount",
                "type": "uint256"
              },
              {
                "internalType": "address",
                "name": "loanAsset",
                "type": "address"
              },
              {
                "internalType": "uint256",
                "name": "loanAmount",
                "type": "uint256"
              },
              {
                "internalType": "address",
                "name": "repaymentAsset",
                "type": "address"
              },
              {
                "internalType": "uint256",
                "name": "interest",
                "type": "uint256"
              },
              {
                "internalType": "enum PawnContract.LoanDurationType",
                "name": "repaymentCycleType",
                "type": "uint8"
              },
              {
                "internalType": "uint256",
                "name": "liquidityThreshold",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "contractStartDate",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "contractEndDate",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "lateThreshold",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "systemFeeRate",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "penaltyRate",
                "type": "uint256"
              },
              {
                "internalType": "uint256",
                "name": "prepaidFeeRate",
                "type": "uint256"
              }
            ],
            "internalType": "struct PawnContract.ContractTerms",
            "name": "terms",
            "type": "tuple"
          },
          {
            "internalType": "enum PawnContract.ContractStatus",
            "name": "status",
            "type": "uint8"
          },
          {
            "internalType": "uint8",
            "name": "lateCount",
            "type": "uint8"
          }
        ],
        "indexed": false,
        "internalType": "struct PawnContract.Contract",
        "name": "data",
        "type": "tuple"
      }
    ],
    "name": "LoanContractCreatedEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "previousOwner",
        "type": "address"
      },
      {
        "indexed": true,
        "internalType": "address",
        "name": "newOwner",
        "type": "address"
      }
    ],
    "name": "OwnershipTransferred",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "address",
        "name": "account",
        "type": "address"
      }
    ],
    "name": "Paused",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "contractId",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "requestId",
            "type": "uint256"
          },
          {
            "internalType": "enum PawnContract.PaymentRequestTypeEnum",
            "name": "paymentRequestType",
            "type": "uint8"
          },
          {
            "internalType": "uint256",
            "name": "remainingLoan",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "penalty",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "interest",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "remainingPenalty",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "remainingInterest",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "dueDateTimestamp",
            "type": "uint256"
          },
          {
            "internalType": "bool",
            "name": "chargePrepaidFee",
            "type": "bool"
          },
          {
            "internalType": "enum PawnContract.PaymentRequestStatusEnum",
            "name": "status",
            "type": "uint8"
          }
        ],
        "indexed": false,
        "internalType": "struct PawnContract.PaymentRequest",
        "name": "data",
        "type": "tuple"
      }
    ],
    "name": "PaymentRequestEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "contractId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "paidPenaltyAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "paidInterestAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "paidLoanAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "paidPenaltyFeeAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "paidInterestFeeAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "prepaidAmount",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "paymentRequestId",
        "type": "uint256"
      }
    ],
    "name": "RepaymentEvent",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "packageId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "collateralId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "enum PawnContract.LoanRequestStatus",
        "name": "status",
        "type": "uint8"
      }
    ],
    "name": "SubmitPawnShopPackage",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "address",
        "name": "account",
        "type": "address"
      }
    ],
    "name": "Unpaused",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "collateralId",
        "type": "uint256"
      },
      {
        "indexed": false,
        "internalType": "address",
        "name": "collateralOwner",
        "type": "address"
      }
    ],
    "name": "WithdrawCollateralEvent",
    "type": "event"
  },
  {
    "inputs": [],
    "name": "ZOOM",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      }
    ],
    "name": "acceptCollateralOfPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_offerId",
        "type": "uint256"
      }
    ],
    "name": "acceptOffer",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      }
    ],
    "name": "activePawnShopPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "admin",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_offerId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      }
    ],
    "name": "cancelOffer",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_contractId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_remainingLoan",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_nextPhrasePenalty",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_nextPhraseInterest",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_dueDateTimestamp",
        "type": "uint256"
      },
      {
        "internalType": "enum PawnContract.PaymentRequestTypeEnum",
        "name": "_paymentRequestType",
        "type": "uint8"
      },
      {
        "internalType": "bool",
        "name": "_chargePrepaidFee",
        "type": "bool"
      }
    ],
    "name": "closePaymentRequestAndStartNew",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "collateralAsLoanRequestMapping",
    "outputs": [
      {
        "internalType": "bool",
        "name": "isInit",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "collateralOffersMapping",
    "outputs": [
      {
        "internalType": "bool",
        "name": "isInit",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_contractId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_collateralPerRepaymentTokenExchangeRate",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_collateralPerLoanAssetExchangeRate",
        "type": "uint256"
      }
    ],
    "name": "collateralRiskLiquidationExecution",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "collaterals",
    "outputs": [
      {
        "internalType": "address",
        "name": "owner",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "amount",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "collateralAddress",
        "type": "address"
      },
      {
        "internalType": "address",
        "name": "loanAsset",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "expectedDurationQty",
        "type": "uint256"
      },
      {
        "internalType": "enum PawnContract.LoanDurationType",
        "name": "expectedDurationType",
        "type": "uint8"
      },
      {
        "internalType": "enum PawnContract.CollateralStatus",
        "name": "status",
        "type": "uint8"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "contractPaymentRequestMapping",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "requestId",
        "type": "uint256"
      },
      {
        "internalType": "enum PawnContract.PaymentRequestTypeEnum",
        "name": "paymentRequestType",
        "type": "uint8"
      },
      {
        "internalType": "uint256",
        "name": "remainingLoan",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "penalty",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "interest",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "remainingPenalty",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "remainingInterest",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "dueDateTimestamp",
        "type": "uint256"
      },
      {
        "internalType": "bool",
        "name": "chargePrepaidFee",
        "type": "bool"
      },
      {
        "internalType": "enum PawnContract.PaymentRequestStatusEnum",
        "name": "status",
        "type": "uint8"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "contracts",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "collateralId",
        "type": "uint256"
      },
      {
        "internalType": "int256",
        "name": "offerId",
        "type": "int256"
      },
      {
        "internalType": "int256",
        "name": "pawnShopPackageId",
        "type": "int256"
      },
      {
        "components": [
          {
            "internalType": "address",
            "name": "borrower",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "lender",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "collateralAsset",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "collateralAmount",
            "type": "uint256"
          },
          {
            "internalType": "address",
            "name": "loanAsset",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "loanAmount",
            "type": "uint256"
          },
          {
            "internalType": "address",
            "name": "repaymentAsset",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "interest",
            "type": "uint256"
          },
          {
            "internalType": "enum PawnContract.LoanDurationType",
            "name": "repaymentCycleType",
            "type": "uint8"
          },
          {
            "internalType": "uint256",
            "name": "liquidityThreshold",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "contractStartDate",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "contractEndDate",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "lateThreshold",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "systemFeeRate",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "penaltyRate",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "prepaidFeeRate",
            "type": "uint256"
          }
        ],
        "internalType": "struct PawnContract.ContractTerms",
        "name": "terms",
        "type": "tuple"
      },
      {
        "internalType": "enum PawnContract.ContractStatus",
        "name": "status",
        "type": "uint8"
      },
      {
        "internalType": "uint8",
        "name": "lateCount",
        "type": "uint8"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_collateralAddress",
        "type": "address"
      },
      {
        "internalType": "int256",
        "name": "_packageId",
        "type": "int256"
      },
      {
        "internalType": "uint256",
        "name": "_amount",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "_loanAsset",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "_expectedDurationQty",
        "type": "uint256"
      },
      {
        "internalType": "enum PawnContract.LoanDurationType",
        "name": "_expectedDurationType",
        "type": "uint8"
      }
    ],
    "name": "createCollateral",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "_idx",
        "type": "uint256"
      }
    ],
    "stateMutability": "payable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "_repaymentAsset",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "_loanAmount",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_duration",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_interest",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_loanDurationType",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_repaymentCycleType",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_liquidityThreshold",
        "type": "uint256"
      }
    ],
    "name": "createOffer",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "_idx",
        "type": "uint256"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "enum PawnContract.PawnShopPackageType",
        "name": "_packageType",
        "type": "uint8"
      },
      {
        "internalType": "address",
        "name": "_loanToken",
        "type": "address"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "lowerBound",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "upperBound",
            "type": "uint256"
          }
        ],
        "internalType": "struct PawnContract.Range",
        "name": "_loanAmountRange",
        "type": "tuple"
      },
      {
        "internalType": "address[]",
        "name": "_collateralAcceptance",
        "type": "address[]"
      },
      {
        "internalType": "uint256",
        "name": "_interest",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_durationType",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "lowerBound",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "upperBound",
            "type": "uint256"
          }
        ],
        "internalType": "struct PawnContract.Range",
        "name": "_durationRange",
        "type": "tuple"
      },
      {
        "internalType": "address",
        "name": "_repaymentAsset",
        "type": "address"
      },
      {
        "internalType": "enum PawnContract.LoanDurationType",
        "name": "_repaymentCycleType",
        "type": "uint8"
      },
      {
        "internalType": "uint256",
        "name": "_loanToValue",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_loanToValueLiquidationThreshold",
        "type": "uint256"
      }
    ],
    "name": "createPawnShopPackage",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "_idx",
        "type": "uint256"
      }
    ],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      }
    ],
    "name": "deactivePawnShopPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_token",
        "type": "address"
      }
    ],
    "name": "emergencyWithdraw",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "feeWallet",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_loanAmount",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_exchangeRate",
        "type": "uint256"
      }
    ],
    "name": "generateContractForCollateralAndPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_zoom",
        "type": "uint256"
      }
    ],
    "name": "initialize",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "initialized",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_contractId",
        "type": "uint256"
      }
    ],
    "name": "lateLiquidationExecution",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "lateThreshold",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_contractId",
        "type": "uint256"
      }
    ],
    "name": "notPaidFullAtEndContractLiquidation",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "numberCollaterals",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "numberContracts",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "numberOffers",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "numberPawnShopPackages",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "operator",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "owner",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "pause",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "paused",
    "outputs": [
      {
        "internalType": "bool",
        "name": "",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "pawnShopPackages",
    "outputs": [
      {
        "internalType": "address",
        "name": "owner",
        "type": "address"
      },
      {
        "internalType": "enum PawnContract.PawnShopPackageStatus",
        "name": "status",
        "type": "uint8"
      },
      {
        "internalType": "enum PawnContract.PawnShopPackageType",
        "name": "packageType",
        "type": "uint8"
      },
      {
        "internalType": "address",
        "name": "loanToken",
        "type": "address"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "lowerBound",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "upperBound",
            "type": "uint256"
          }
        ],
        "internalType": "struct PawnContract.Range",
        "name": "loanAmountRange",
        "type": "tuple"
      },
      {
        "internalType": "uint256",
        "name": "interest",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "durationType",
        "type": "uint256"
      },
      {
        "components": [
          {
            "internalType": "uint256",
            "name": "lowerBound",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "upperBound",
            "type": "uint256"
          }
        ],
        "internalType": "struct PawnContract.Range",
        "name": "durationRange",
        "type": "tuple"
      },
      {
        "internalType": "address",
        "name": "repaymentAsset",
        "type": "address"
      },
      {
        "internalType": "enum PawnContract.LoanDurationType",
        "name": "repaymentCycleType",
        "type": "uint8"
      },
      {
        "internalType": "uint256",
        "name": "loanToValue",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "loanToValueLiquidationThreshold",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "penaltyRate",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "prepaidFeeRate",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      }
    ],
    "name": "rejectCollateralOfPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "renounceOwnership",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_contractId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_paidPenaltyAmount",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_paidInterestAmount",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_paidLoanAmount",
        "type": "uint256"
      }
    ],
    "name": "repayment",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_newFeeWallet",
        "type": "address"
      }
    ],
    "name": "setFeeWallet",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_threshold",
        "type": "uint256"
      }
    ],
    "name": "setLateThreshold",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_newOperator",
        "type": "address"
      }
    ],
    "name": "setOperator",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_feeRate",
        "type": "uint256"
      }
    ],
    "name": "setPenaltyRate",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_feeRate",
        "type": "uint256"
      }
    ],
    "name": "setPrepaidFeeRate",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_feeRate",
        "type": "uint256"
      }
    ],
    "name": "setSystemFeeRate",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "_token",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "_status",
        "type": "uint256"
      }
    ],
    "name": "setWhitelistCollateral",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      }
    ],
    "name": "submitCollateralToPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "systemFeeRate",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "newOwner",
        "type": "address"
      }
    ],
    "name": "transferOwnership",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "unPause",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "name": "whitelistCollateral",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      }
    ],
    "name": "withdrawCollateral",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "_collateralId",
        "type": "uint256"
      },
      {
        "internalType": "uint256",
        "name": "_packageId",
        "type": "uint256"
      }
    ],
    "name": "withdrawCollateralFromPackage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
];
const web3 = require('../web3')
const pawmContract = new web3[0].eth.Contract(abi, process.env.PAWM_CONTRACT_ADDRESS, {
    transactionConfirmationBlocks: 1
})

module.exports = pawmContract
