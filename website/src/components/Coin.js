import { Image } from "antd"
import coin from "../assets/img/coin.png"

const Coin = ({ width, x, y, opacity }) => {
    return (
        <div style={{
            zIndex: 0,
            position: 'absolute',
            left: `${x}%`,
            top: `${y}%`,
            opacity: opacity,
            width: '100%'
        }}>
            <Image src={coin}
                width={width}
                preview={false}
            />
        </div>
    )
}

export default Coin