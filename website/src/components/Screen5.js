import { Carousel } from '3d-react-carousal';
import { members } from '../assets/member';
import { membersMobile } from '../assets/memberMobile';
import aos from 'aos'
import { useEffect } from 'react'

const Screen5 = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 2000
        })
    }, [])

    return (
        <div  style={{
            zIndex: 2,
            position: 'relative',
        }}>
            <div
                id='top-content-5'
                data-aos="fade"
                style={{
                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'center',
                }}>
                <p 
                className='screen2-title'
                style={{
                    fontWeight: 'bold',
                    color: '#EEC13F'
                }}>
                    OUR TEAM
                </p>
            </div>
            <div className='member'>
                <Carousel slides={members} autoplay={true} interval={5000} arrows={false}/>
            </div>
            <div className='member-mobile'>
                <Carousel slides={membersMobile} autoplay={true} interval={5000} arrows={false}/>
            </div>
        </div>
    )
}

export default Screen5