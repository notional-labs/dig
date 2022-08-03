import { Image } from "antd"
import dig from '../../assets/img/dig.png'
import uk from '../../assets/img/uk.png'
import florida from '../../assets/img/florida.png'
import bvi from '../../assets/img/bvi.png'
import ukraine from '../../assets/img/ukraine.png'
import texas from '../../assets/img/texas.png'

const TreeMobile = ({ }) => {

    const handleEnter = (e) => {
        e.target.style.backgroundImage = 'Linear-Gradient(263.6deg, #4D4D4D 0%, #000000 100%)'
        e.target.style.border = 'solid 2px #EEC13F'
    }

    const handleLeave = (e) => {
        e.target.style.backgroundImage = 'Linear-Gradient(#EEC13F 0%, #FFAC38 100%)'
    }

    return (
        <div
            className='tree-mobile'
            style={{
                padding: '10px'
            }}>
            <div
                data-aos="fade-down"
                style={{
                    border: 'solid 1px #FFAC38',
                    padding: 10,
                    borderRadius: '50%',
                    display: 'inline-block',
                    marginBottom: '50px'
                }}>
                <Image src={dig}
                    preview={false}
                    width={100}
                    style={{
                        border: 'solid 1px #ffffff',
                        borderRadius: '50%'
                    }}
                />
            </div>
            <div style={{
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center',
                marginBottom: '20px'
            }}>
                <div
                    data-aos="zoom-in"
                    data-aos-delay="500"
                    style={{
                        border: 'solid 1px #FFAC38',
                        padding: '5px',
                        borderRadius: '50%',
                        display: 'inline-block',
                        margin: 'auto'
                    }}>
                    <Image src={uk}
                        preview={false}
                        width={60}
                        style={{
                            border: 'solid 1px #ffffff',
                            borderRadius: '50%'
                        }}
                    />
                </div>
                <p style={{
                    color: '#EEC13F',
                    fontWeight: 'bold',
                    fontSize: '24px',
                    margin: 'auto'
                }}>
                    Dig UK
                </p>
            </div>
            <div style={{
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center',
                marginBottom: '20px'
            }}>
                <div
                    data-aos="zoom-in"
                    data-aos-delay="500"
                    style={{
                        border: 'solid 1px #FFAC38',
                        padding: '5px',
                        borderRadius: '50%',
                        display: 'inline-block',
                        margin: 'auto'
                    }}>
                    <Image src={florida}
                        preview={false}
                        width={60}
                        style={{
                            border: 'solid 1px #ffffff',
                            borderRadius: '50%'
                        }}
                    />
                </div>
                <p style={{
                    color: '#EEC13F',
                    fontWeight: 'bold',
                    fontSize: '24px',
                    margin: 'auto'
                }}>
                    Dig Florida
                </p>
            </div>
            <div style={{
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center',
                marginBottom: '20px'
            }}>
                <div
                    data-aos="zoom-in"
                    data-aos-delay="500"
                    style={{
                        border: 'solid 1px #FFAC38',
                        padding: '5px',
                        borderRadius: '50%',
                        display: 'inline-block',
                        margin: 'auto'
                    }}>
                    <Image src={bvi}
                        preview={false}
                        width={60}
                        style={{
                            border: 'solid 1px #ffffff',
                            borderRadius: '50%'
                        }}
                    />
                </div>
                <p style={{
                    color: '#EEC13F',
                    fontWeight: 'bold',
                    fontSize: '24px',
                    margin: 'auto'
                }}>
                    Dig BVI
                </p>
            </div>
            <div style={{
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center',
                marginBottom: '20px'
            }}>
                <div
                    data-aos="zoom-in"
                    data-aos-delay="500"
                    style={{
                        border: 'solid 1px #FFAC38',
                        padding: '5px',
                        borderRadius: '50%',
                        display: 'inline-block',
                        margin: 'auto'
                    }}>
                    <Image src={ukraine}
                        preview={false}
                        width={60}
                        style={{
                            border: 'solid 1px #ffffff',
                            borderRadius: '50%'
                        }}
                    />
                </div>
                <p style={{
                    color: '#EEC13F',
                    fontWeight: 'bold',
                    fontSize: '24px',
                    margin: 'auto'
                }}>
                    Dig Ukraine
                </p>
            </div>
            <div style={{
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center',
                marginBottom: '20px'
            }}>
                <div
                    data-aos="zoom-in"
                    data-aos-delay="500"
                    style={{
                        border: 'solid 1px #FFAC38',
                        padding: '5px',
                        borderRadius: '50%',
                        display: 'inline-block',
                        margin: 'auto'
                    }}>
                    <Image src={texas}
                        preview={false}
                        width={60}
                        style={{
                            border: 'solid 1px #ffffff',
                            borderRadius: '50%'
                        }}
                    />
                </div>
                <p style={{
                    color: '#EEC13F',
                    fontWeight: 'bold',
                    fontSize: '24px',
                    margin: 'auto'
                }}>
                    Dig Texas
                </p>
            </div>
        </div>
    )
}

export default TreeMobile