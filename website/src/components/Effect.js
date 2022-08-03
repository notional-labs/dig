
const Effect = ({x, y, radius, opacity}) => {
    const style = {
        div: {
            position: 'absolute',
            zIndex: 0,
            left: `${x}%`,
            top: `${y}%`,
            width: '100%',
        },
        effect: {
            width: `${radius}px`,
            height: `${radius}px`, 
            opacity: opacity
        }
    }
     
    return (
        <div style={style.div}>
            <div className="glow" style={style.effect}>

            </div>
        </div>
    )
}

export default Effect