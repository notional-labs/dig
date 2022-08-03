import { Input } from "antd"
import { useState } from "react"

const style = {
    formTitle: {
        fontFamily: 'montserrat',
        color: '#ffffff',
        fontWeight: 500,
        fontSize: '16px',
        margin: 0
    },
    button: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'end',
        marginTop: '2rem',
        marginBottom: '1rem'
    },
}

const SetNameModal = ({ account, wrapSetShow, wrapSetAccounts, index }) => {
    const [input, setInput] = useState('')

    const checkDisable = () => {
        if(input === '') return true
        return false
    }

    const onChange = (e) => {
        setInput(e.target.value)
    }

    const handleClick = () => {
        let accounts = JSON.parse(localStorage.getItem('accounts'))

        accounts[index].key = {
            name: input
        }

        localStorage.setItem('accounts', JSON.stringify([...accounts]))
        wrapSetAccounts(accounts)
        wrapSetShow(false)
    }

    return (
        <div>
            <p style={style.formTitle}>Wallet name</p>
            <Input
                defaultValue={account.key ? account.key.name : 'unname'}
                onChange={onChange}
                style={{
                    borderRadius: '10px',
                    color: '#ffffff'
                }}
            />
            <div style={style.button}>
                <button onClick={() => {
                    wrapSetShow(false)
                    setInput('')
                }}
                    style={{
                        border: 0,
                        borderRadius: '10px',
                        width: '20%',
                        height: '2.5rem',
                        fontSize: '15px',
                        backgroundColor: '#C4C4C4',
                        color: '#ffffff',
                        fontFamily: 'montserrat',
                        marginRight: '20px'
                    }}>
                    Cancel
                </button>
                <button disabled={checkDisable()}
                    onClick={handleClick}
                    style={{
                        border: 0,
                        borderRadius: '10px',
                        width: '20%',
                        height: '2.5rem',
                        fontSize: '15px',
                        backgroundColor: '#E4BA40',
                        color: '#ffffff',
                        fontFamily: 'montserrat'
                    }}>
                    Update
                </button>
            </div>
        </div>
    )
}

export default SetNameModal
