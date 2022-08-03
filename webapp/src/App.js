import './App.css';
import { Modal, } from 'antd';
import { useCallback, useState } from 'react';
import ConnectButton from './components/ConnectButton';
import AccountDetail from './pages/AccountDetail';
import { getKeplr, addDig } from './helpers/getKeplr';
import ValidatorsList from './pages/ValidatorsList';
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link,
  NavLink,
  useLocation
} from "react-router-dom";
import logo from './assets/img/DIG.png';
import keplrLogo from './assets/img/keplr.png'
import metaMaskLogo from './assets/img/metamask.png'
import { Image, message } from 'antd';
import { getWeb3Instance } from "./helpers/ethereum/lib/metamaskHelpers";
import { GithubFilled, } from '@ant-design/icons'
import "@fontsource/montserrat"
import AccountList from './pages/AccountList';
import ProposalList from './pages/ProposalList';
import { FaDiscord, FaTelegramPlane } from "react-icons/fa";
import ProposalDetail from './pages/ProposalDetail';
import FrontPage from './pages/FrontPage';
import Effect from './components/Effect';

const style = {
  button: {
    marginTop: '5rem',
  },
  divButton: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-between'
  },
  navbar: {
    padding: 50,
    paddingTop: 0,
    paddingBottom: 0,
    backgroundColor: '#4D4D4D',
    position: 'fixed',
    zIndex: 1,
    top: 0,
    left: 0,
    width: '300px',
    height: '100%',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-between'
  },
  tabButton: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'start',
    verticalAlign: 'center',
    textAlign: 'left',
    paddingLeft: 0
  },
  buttonContent: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'start',
  },
  contact: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'end',
    padding: 90,
    paddingTop: 0,
    paddingBottom: 0
  },
  li: {
    textAlign: 'left',
    paddingBottom: '2em'
  },
  contactText: {
    color: '#ffffff',
    fontSize: '16px'
  }
}

const App = () => {
  const [accounts, setAccounts] = useState(JSON.parse(localStorage.getItem('accounts')) || [])
  const [show, setShow] = useState(false)
  let location = useLocation();

  const wrapSetShow = useCallback((val) => {
    setShow(val)
  }, [setShow])

  const wrapSetAccounts = useCallback((val) => {
    setAccounts([...val])
  }, [setAccounts])

  const handleClose = () => {
    setShow(false)
  }

  const warning = (val) => {
    message.warning(val, 1)
  }

  const connect = async (val) => {
    if (val === 'keplr') {
      const { accounts, key } = await getKeplr()
      if (accounts !== null) {
        if (!localStorage.getItem('accounts')) {
          localStorage.setItem('accounts', JSON.stringify([{ account: accounts[0], type: 'keplr', key }]))
          setAccounts([{ account: accounts[0], type: 'keplr' }])
        }
        else if (localStorage.getItem('accounts')) {
          let accountsList = JSON.parse(localStorage.getItem('accounts'))
          if (accountsList.filter(acc => acc.account.address === accounts[0].address).length === 0) {
            accountsList.push({ account: accounts[0], type: 'keplr', key })
            localStorage.setItem('accounts', JSON.stringify(accountsList))
            setAccounts([...accountsList])
            warning('Success')
          }
          else {
            warning('This wallet account already exist')
          }
        }
      }
    }
    else {
      let web3 = await getWeb3Instance();
      try {
        const accounts = (await web3.eth.getAccounts());
        console.log(accounts)
        if (!localStorage.getItem('accounts')) {
          localStorage.setItem('accounts', JSON.stringify([{ account: accounts[0], type: 'metamask', key: {
            name: 'unnamed'
          } }]))
          setAccounts([{ account: accounts[0], type: 'metamask' }])
        }
        if (localStorage.getItem('accounts')) {
          let accountsList = JSON.parse(localStorage.getItem('accounts'))
          if (accountsList.filter(acc => acc.type === "metamask" && acc.account === accounts[0]).length === 0) {
            accountsList.push({ account: accounts[0], type: 'metamask', key: {
              name: 'unnamed'
            } })
            localStorage.setItem('accounts', JSON.stringify(accountsList))
            setAccounts([...accountsList])
            warning('Success')
          }
          else {
            warning('This wallet account already exist')
          }
        }
      } catch {
        warning('Check if you have login into Metmask')
      }
      //metamask logic
    }
  }

  return (
    <div className="App">
      <div style={style.navbar}>
        <div>
          <div style={{
            textAlign: 'left',
            borderBottom: 'solid 2px #EEC13F',
            padding: 50,
            paddingLeft: 0,
            paddingRight: 100
          }}>
            <Link to='/'>
              <Image width={90}
                src={logo}
                preview={false}
              />
            </Link>
          </div>
          <div className='nav-bar'>
            <ul
              className='nav-button'
              style={{ listStyleType: 'none', alignItems: 'left' }}>
              <li style={style.li}>
                <NavLink to='/accounts'>
                  <button style={{
                    fontSize: '20px',
                    backgroundColor: 'transparent',
                    color: location.pathname.includes('/accounts') ? '#EEC13F' : '#ffffff',
                    padding: 0,
                    paddingTop: 5,
                    paddingBottom: 30,
                    border: 0,
                    fontFamily: 'montserrat',
                    lineHeight: '100%',
                    fontStyle: 'regular',
                    fontWeight: 'bold'
                  }} className='nav-link'>
                    Accounts
                  </button>
                </NavLink>
              </li>
              <li style={style.li}>
                <NavLink to='/staking'>
                  <button style={{
                    fontSize: '20px',
                    backgroundColor: 'transparent',
                    color: location.pathname.includes('/staking') ? '#EEC13F' : '#ffffff',
                    padding: 0,
                    paddingTop: 5,
                    paddingBottom: 30,
                    border: 0,
                    fontFamily: 'montserrat',
                    lineHeight: '100%',
                    fontStyle: 'regular',
                    fontWeight: 'bold'
                  }} className='nav-link'>
                    Staking
                  </button>
                </NavLink>
              </li>
              <li style={style.li}>
                <NavLink to='/proposals'>
                  <button style={{
                    fontSize: '20px',
                    backgroundColor: 'transparent',
                    color: location.pathname.includes('/proposals') ? '#EEC13F' : '#ffffff',
                    padding: 0,
                    paddingTop: 5,
                    paddingBottom: 30,
                    border: 0,
                    fontFamily: 'montserrat',
                    lineHeight: '100%',
                    fontStyle: 'regular',
                    fontWeight: 'bold'
                  }} className='nav-link'>
                    Proposals
                  </button>
                </NavLink>
              </li>
              <li style={style.li}>
                <ConnectButton wrapSetShow={wrapSetShow} />
              </li>
            </ul>
          </div>
        </div>
        <div
          style={{
            marginBottom: '2em'
          }}
        >
          <p style={{
            color: '#ffffff',
            fontSize: '24px',
            textAlign: 'left',
          }}>Contact</p>
          <ul style={{ ...style.tabButton, listStyleType: 'none', }}>
            <li style={{
              fontSize: '2rem',
              color: '#ffffff',
              marginRight: '1em',
            }}>
              <a href='https://github.com/notional-labs' target='_blank'>
                <GithubFilled style={{ color: '#ffffff', fontSize: '30px', marginRight: '20px' }} />
                <span style={style.contactText}>
                  Github
                </span>
              </a>
            </li>
            <li style={{
              fontSize: '2.5rem',
              color: '#ffffff',
              marginRight: '1em',
            }}>
              <a href='https://discord.com/invite/8wHsSz5TWQ' target='_blank'>
                <FaDiscord style={{ color: '#ffffff', fontSize: '30px', marginRight: '20px' }} />
                <span style={style.contactText}>
                  Discord
                </span>
              </a>
            </li>
            <li style={{
              fontSize: '2.5rem',
              color: '#ffffff',
              marginRight: '1em',
            }}>
              <a href='https://t.me/digchain_official' target='_blank'>
                <FaTelegramPlane style={{ color: '#ffffff', fontSize: '30px', marginRight: '20px' }} />
                <span style={style.contactText}>
                  Telegram
                </span>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div style={{ margin: '0 auto', width: '100%', overflow: 'hidden', position: 'relative', marginLeft: '300px' }}>
        <Effect x={5} y={-100} radius={1500} opacity={0.4} />
        <Effect x={70} y={30} radius={300} opacity={0.3} />
        <Effect x={-20} y={50} radius={500} opacity={0.4} />
        <Effect x={80} y={70} radius={500} opacity={0.4} />
        <div style={{ position: 'relative', zIndex: 1 }}>
          <Routes>
            <Route exact path="/" element={<FrontPage />} />
            <Route exact path="/staking" element={<ValidatorsList />} />
            <Route exact path="/accounts" element={<AccountList accounts={accounts} wrapSetAccounts={wrapSetAccounts} />} />
            <Route exact path="/accounts/:id" element={<AccountDetail accounts={accounts} />} />
            <Route exact path="/proposals" element={<ProposalList accounts={accounts} />} />
            <Route exact path="/proposals/:id" element={<ProposalDetail accounts={accounts} />} />
          </Routes>
        </div>
      </div>
      <Modal
        visible={show}
        footer={null}
        closable={false}
        onCancel={handleClose}
      >
        <div style={{
          backgroundColor: '#4D4D4D',
          color: '#EEC13F',
          fontFamily: 'montserrat',
          fontSize: '24px',
          border: 0,
          padding: '0 .5rem 0 .5rem',
        }}>
          <p>
            Import Account
          </p>
          <div>
            <div style={style.divButton}>
              <button style={{
                backgroundColor: 'transparent',
                color: '#ffffff',
                border: 0,
                borderBottom: 'solid 1px #ffffff'
              }}
                onClick={async () => {
                  await connect('keplr')
                  setShow(false)
                }}>
                <div style={style.buttonContent}>
                  <div>
                    <Image width={50}
                      src={keplrLogo}
                      preview={false} />
                  </div>
                  <div style={{ marginLeft: '25px', fontSize: '1.5rem', }}>
                    <p style={{ margin: 0, textAlign: 'left' }}>Keplr</p>
                    <p style={{ fontSize: '0.75rem', }}>
                      Keplr browser extension
                    </p>
                  </div>
                </div>
              </button>
              <button style={{
                backgroundColor: 'transparent',
                color: '#ffffff',
                marginTop: '1em',
                border: 0
              }}
                onClick={async () => {
                  await connect('metamask')
                  setShow(false)
                }}>
                <div style={style.buttonContent}>
                  <div>
                    <Image width={50}
                      src={metaMaskLogo}
                      preview={false} />
                  </div>
                  <div style={{ marginLeft: '25px', fontSize: '1.5rem' }}>
                    <p style={{ margin: 0, textAlign: 'left', }}>Metamask</p>
                    <p style={{ fontSize: '0.75rem', }}>
                      Metamask browser extension
                    </p>
                  </div>
                </div>
              </button>
            </div>
          </div>
        </div>
      </Modal>
    </div>
  );
}

export default App;
