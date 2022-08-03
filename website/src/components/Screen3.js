import { Image } from "antd"
import icon from '../assets/img/vector2.png'
import Roadmap from "./subScreen3/Roadmap"
import aos from 'aos'
import { useEffect } from 'react'
import RoadmapMobile from "./subScreen3/RoadmapMobile"

const Screen3 = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 1000
        })
    }, [])

    return (
        <div style={{
            zIndex: 1,
        }}>
            <div
                id='top-content-3'
                data-aos="fade"
                style={{

                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'center',
                }}>
                <p
                    className="screen2-title"
                    style={{
                        fontWeight: 700,
                        color: '#EEC13F'
                    }}>
                    ROADMAP
                </p>
                <div className="icon">
                    <Image src={icon}
                        preview={false}
                        style={{
                            marginLeft: '15px',
                            marginTop: '15px'
                        }} />
                </div>
            </div>
            <Roadmap />
            <RoadmapMobile/>
        </div>
    )
}

export default Screen3