import Effect from "../components/Effect"
import Screen1 from "../components/Screen1"
import Screen2 from "../components/Screen2"
import Screen3 from "../components/Screen3"
import Screen4 from "../components/Screen4"
import Screen5 from "../components/Screen5"
import Screen6 from "../components/Screen6"
import Coin from "../components/Coin"

const style = {
    nav: {
        color: '#ffffff',
    }
}

const MainPage = () => {
    return (
        <div className="content" style={{ fontFamily: 'Montserrat', width: '100%', margin: 'auto', position: 'relative',}}>
            <ul className="nav-bar">
                <a href='https://github.com/notional-labs/dig'
                    target='_blank'
                    rel="noreferrer"
                    style={{
                        color: '#ffffff',
                        textDecoration: 'none'
                    }}
                >
                    <li>
                        Github
                    </li>
                </a>
                <a href='http://medium.com/@digchain_official'
                    target='_blank'
                    rel="noreferrer"
                    style={{
                        color: '#ffffff',
                        textDecoration: 'none'
                    }}
                >
                    <li>
                        Updates
                    </li>
                </a>
                <a href='https://github.com/notional-labs/dig/blob/master/docs/whitepaper.md'
                    target='_blank'
                    rel="noreferrer"
                    style={{
                        color: '#ffffff',
                        textDecoration: 'none'
                    }}
                >
                    <li>
                        Docs
                    </li>
                </a>
                <a href='https://discord.gg/R44XTwfbmU'
                    target='_blank'
                    rel="noreferrer"
                    style={{
                        color: '#ffffff',
                        textDecoration: 'none'
                    }}
                >
                    <li>
                        Discord
                    </li>
                </a>
                <a href='https://docs.google.com/spreadsheets/d/14p0XqHbDTS7H3SKVeEx72FKjhQUii6XrwdXAOuzP73w/edit?usp=sharing'
                    target='_blank'
                    rel="noreferrer"
                    style={{
                        color: '#ffffff',
                        textDecoration: 'none'
                    }}
                >
                    <li>
                        Tokenomics
                    </li>
                </a>
            </ul>
            <Screen1 />
            <Screen2 />
            <Screen3 />
            <Screen4 />
            <Screen5 />
            <Screen6 />
        </div>
    )
}

export default MainPage