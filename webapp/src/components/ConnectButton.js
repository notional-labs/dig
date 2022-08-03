import "@fontsource/merriweather"
import { ArrowRightOutlined } from '@ant-design/icons'
import { IoWalletOutline } from "react-icons/io5";

const style = {
    buttonText: {
        fontSize: '16px',
        fontWeight: '700 bold',
        color: '#ffffff',
        fontFamily: 'montserrat'
    }
}

const ConnectButton = ({ wrapSetShow }) => {
    return (
        <div style={style.buttonText}>
            <button
                className="hover-button"
                onClick={async () => {
                    await wrapSetShow(true)
                }}>
                    <IoWalletOutline style={{
                        marginRight: '10px'
                    }} />
                Import Account
            </button>
        </div>
    )
}

export default ConnectButton
