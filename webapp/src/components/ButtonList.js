import { useState, useEffect } from 'react'
import { DoubleLeftOutlined, LeftOutlined, RightOutlined, DoubleRightOutlined } from '@ant-design/icons'

const style = {
    container: {
        padding: 0,
        width: '100%',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'center'
    },
    button: {
        borderRadius: '50%',
        padding: 5,
        border: 0,
        backgroundColor: 'transparent'
    },
    quickButton: {
        border: 'none',
        color: '#ffffff',
        backgroundColor: 'transparent'
    }
}

const ButtonList = ({ total, wrapSetParams, currentPage }) => {
    const [buttons, setButtons] = useState([])

    const handleOver = (e, i) => {
        if (currentPage != i + 1) {
            e.target.style.backgroundColor = 'rgb(0, 0, 0, 0.25)'
        }
    }

    const handleLeave = (e, i) => {
        if (currentPage != i + 1) {
            e.target.style.backgroundColor = 'transparent'
        }
    }

    const handleCLick = (index) => {
        wrapSetParams(index)
    }

    const checkDisable = (type) => {
        if (type === 'double-left') {
            if (currentPage == 1) return true
            return false
        }
        if (type === 'left') {
            if (currentPage == 1) return true
            return false
        }
        if (type === 'right') {
            if (currentPage == total) return true
            return false
        }
        if (type === 'double-right') {
            if (currentPage == total) return true
            return false
        }
    }

    useEffect(() => {
        let buttonList = []
        for (let i = 0; i < total; i++) {
            buttonList.push(
                <button
                    style={{
                        ...style.button,
                    }}
                    onClick={() => handleCLick(i + 1)}>
                    {i + 1}
                </button>
            )
        }
        setButtons([...buttonList])
    }, [total])
    return (
        <div style={style.container}>
            <div>
                <button
                    disabled={checkDisable('double-left')}
                    style={{ ...style.quickButton, color: currentPage === 1 ? 'rgb(255, 255, 255, 0.5)' : '#ffffff' }}
                    onClick={() => handleCLick(1)}>
                    <DoubleLeftOutlined />
                </button>
            </div>
            <div>
                <button
                    disabled={checkDisable('left')}
                    style={{ ...style.quickButton, color: currentPage === 1 ? 'rgb(255, 255, 255, 0.5)' : '#ffffff' }}
                    onClick={() => handleCLick(currentPage - 1)}>
                    <LeftOutlined />
                </button>
            </div>
            {
                total <= 5 ? (
                    <div >
                        {buttons.map((button, index) => <span


                            style={{
                                color: currentPage === index + 1 ? '#EEC13F' : '#ffffff',
                                width: '50%',
                                borderRadius: '50%',
                                margin: '0.3em'
                            }}>{button}</span>)}
                    </div>
                ) : currentPage - 1 <= 1 ? (
                    <div >
                        {buttons.map((button, index) => {
                            if (index < 5) return <span


                                style={{
                                    color: currentPage === index + 1 ? '#EEC13F' : '#ffffff',
                                    width: '50%',
                                    borderRadius: '50%',
                                    margin: '0.3em'
                                }}>{button}</span>
                        })}
                    </div>
                ) : currentPage - 1 >= 1 && total - currentPage > 1 ? (
                    <div >
                        {buttons.map((button, index) => index < currentPage + 2 && index >= currentPage - 3 && <span


                            style={{
                                color: currentPage === index + 1 ? '#EEC13F' : '#ffffff',
                                width: '50%',
                                borderRadius: '50%',
                                margin: '0.3em'
                            }}>{button}</span>)}
                    </div>
                ) : total - currentPage === 1 ? (
                    <div >
                        {buttons.map((button, index) => index < total && index >= currentPage - 4 && <span


                            style={{
                                color: currentPage === index + 1 ? '#EEC13F' : '#ffffff',
                                width: '50%',
                                borderRadius: '50%',
                                margin: '0.3em'
                            }}>{button}</span>)}
                    </div>
                ) : (
                    <div >
                        {buttons.map((button, index) => index < total && index >= currentPage - 5 && <span


                            style={{
                                color: currentPage === index + 1 ? '#EEC13F' : '#ffffff',
                                width: '50%',
                                borderRadius: '50%',
                                margin: '0.3em'
                            }}>{button}</span>)}
                    </div>
                )
            }
            <div>
                <button
                    disabled={checkDisable('right')}
                    style={{ ...style.quickButton, color: currentPage == total ? 'rgb(255, 255, 255, 0.5)' : '#ffffff' }}
                    onClick={() => handleCLick(currentPage + 1)}>
                    <RightOutlined />
                </button>
            </div>
            <div>
                <button
                    disabled={checkDisable('double-right')}
                    style={{ ...style.quickButton, color: currentPage == total ? 'rgb(255, 255, 255, 0.5)' : '#ffffff' }}
                    onClick={() => handleCLick(parseInt(total))}>
                    <DoubleRightOutlined />
                </button>
            </div>
        </div>
    )
}

export default ButtonList