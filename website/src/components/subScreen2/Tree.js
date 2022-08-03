import { Tree, TreeNode } from 'react-organizational-chart';
import { Image } from "antd"
import dig from '../../assets/img/dig.png'
import uk from '../../assets/img/uk.png'
import florida from '../../assets/img/florida.png'
import bvi from '../../assets/img/bvi.png'
import ukraine from '../../assets/img/ukraine.png'
import texas from '../../assets/img/texas.png'
import aos from 'aos'
import { useEffect } from 'react'

const TreeGraph = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 2000
        })
    }, [])

    const handleEnter = (e) => {
        e.target.style.backgroundImage = 'Linear-Gradient(263.6deg, #4D4D4D 0%, #000000 100%)'
        e.target.style.border = 'solid 2px #EEC13F'
    }

    const handleLeave = (e) => {
        e.target.style.backgroundImage = 'Linear-Gradient(#EEC13F 0%, #FFAC38 100%)'
    }

    return (
        <div
            className='tree'
            style={{
                padding: '0px 5% 0px 5%'
            }}>
            <Tree
                lineWidth={'2px'}
                lineHeight={'130px'}
                lineColor={'#FFAC38'}
                lineBorderRadius={'10px'}
                label={<div
                    data-aos="fade-down"
                    style={{
                        border: 'solid 1px #FFAC38',
                        padding: 20,
                        borderRadius: '50%',
                        display: 'inline-block'
                    }}>
                    <Image src={dig}
                        preview={false}
                        width={200}
                        style={{
                            border: 'solid 1px #ffffff',
                            borderRadius: '50%'
                        }}
                    />
                </div>}
            >
                <TreeNode label={<div >
                    <div
                        data-aos="zoom-in"
                        data-aos-delay="500"
                        style={{
                            border: 'solid 1px #FFAC38',
                            padding: 20,
                            borderRadius: '50%',
                            display: 'inline-block'
                        }}>
                        <Image src={uk}
                            preview={false}
                            width={170}
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
                        marginTop: '50px'
                    }}>
                        Dig UK
                    </p>
                </div>}>

                </TreeNode>
                <TreeNode label={<div>
                    <div
                        data-aos="zoom-in"
                        data-aos-delay="1000"
                        style={{
                            border: 'solid 1px #FFAC38',
                            padding: 20,
                            borderRadius: '50%',
                            display: 'inline-block'
                        }}>
                        <Image src={florida}
                            preview={false}
                            width={170}
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
                        marginTop: '50px'
                    }}>
                        Dig Florida
                    </p>
                </div>}>

                </TreeNode>
                <TreeNode label={<div>
                    <div
                        data-aos="zoom-in"
                        data-aos-delay="1500"
                        style={{
                            border: 'solid 1px #FFAC38',
                            padding: 20,
                            borderRadius: '50%',
                            display: 'inline-block'
                        }}>
                        <Image src={bvi}
                            preview={false}
                            width={170}
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
                        marginTop: '50px'
                    }}>
                        Dig BVI
                    </p>
                </div>}>

                </TreeNode>
                <TreeNode label={<div>
                    <div
                        data-aos="zoom-in"
                        data-aos-delay="2000"
                        style={{
                            border: 'solid 1px #FFAC38',
                            padding: 20,
                            borderRadius: '50%',
                            display: 'inline-block'
                        }}>
                        <Image src={ukraine}
                            preview={false}
                            width={170}
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
                        marginTop: '50px'
                    }}>
                        Dig Ukraine
                    </p>
                </div>}>

                </TreeNode>
                <TreeNode label={<div>
                    <div
                        data-aos="zoom-in"
                        data-aos-delay="2500"
                        style={{
                            border: 'solid 1px #FFAC38',
                            padding: 20,
                            borderRadius: '50%',
                            display: 'inline-block'
                        }}>
                        <Image src={texas}
                            preview={false}
                            width={170}
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
                        marginTop: '50px'
                    }}>
                        Dig Texas
                    </p>
                </div>}>

                </TreeNode>
            </Tree>
        </div>
    )
}

export default TreeGraph