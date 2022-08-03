import { useState, useEffect, useCallback } from "react";
import {
    useParams,
    Link
} from "react-router-dom";
import { getProposal, getProposer, getTally } from "../helpers/getProposal";
import '../assets/css/ProposalDetail.css'
import VoterList from "../components/VoterList";
import { Modal } from "antd";
import VoteModal from "../components/VoteModal";
import { RiBarChart2Fill } from "react-icons/ri";
import CreateProposalModal from "../components/CreateProposalModal";
import DepositModal from "../components/DepositModal";
import { FaCoins} from "react-icons/fa";

const style = {
    card: {
        borderRadius: '10px',
        minHeight: '100%',
        fontFamily: 'montserrat',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-between',
        marginBottom: '2em',
        color: '#ffffff',
    },
    title: {
        textAlign: 'left',
        fontWeight: 'bold',
        fontSize: '1.3rem',
        color: '#EEC13F'
    },
    content: {
        textAlign: 'left',
        padding: '40px',
        borderRadius: '10px',
        border: 'solid 2px #EEC13F'
    },
    voters: {
        borderRadius: '10px',
        color: '#ffffff',
        fontFamily: 'montserrat',
        marginTop: 0
    },
    breadcrumb: {
        textAlign: 'left',
        fontWeight: 700,
        fontSize: '24px',
        color: '#ffffff',
        fontFamily: 'montserrat',
        paddingBottom: '50px'
    },
    buttonBox: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        padding: '20 20 20 20',
        marginTop: '1.5em',
    },
    detail: {
        padding: '1em',
        borderRadius: '10px',
        fontWeight: 'bold',
        width: '150px',
        backgroundColor: '#C4C4C4',
        color: '#000000',
        border: 0
    },
    extraButton: {
        padding: '1em',
        borderRadius: '10px',
        fontWeight: 'bold',
        backgroundColor: '#1D5470',
        color: '#ffffff',
        width: '150px',
        border: 0
    },
}

const ProposalDetail = ({ accounts }) => {
    const [proposal, setProposal] = useState([])
    const [proposer, setProposer] = useState({
        proposal_id: -1,
        proposer: ''
    })
    let { id } = useParams();
    const [show, setShow] = useState(false)
    const [showCreateProposal, setShowCreateProposal] = useState(false)
    const [showDeposit, setShowDeposit] = useState(false)

    useEffect(() => {
        (async () => {
            const res = await getProposal(id)
            const proposalById = res.result
            const proposer = await getProposer(id)
            if (proposalById.status === 1 || proposalById.status === 2) {
                const tally = await getTally(proposalById.id)
                proposalById.tally = tally.result
            }
            setProposer({ ...proposer.result })
            setProposal([proposalById])
        })()
    }, [id])

    const handleClose = () => {
        setShow(false)
    }

    const handleCloseDeposit = () => {
        setShowDeposit(false)
    }       

    const wrapSetShow = useCallback((val) => {
        setShow(val)
    }, [setShow])

    const handleCloseCreateProposal = () => {
        setShowCreateProposal(false)
    }

    const wrapSetShowCreateProposal = useCallback((val) => {
        setShowCreateProposal(val)
    }, [setShowCreateProposal])

    const wrapSetShowDeposit = useCallback((val) => {
        setShowDeposit(val)
    }, [setShowDeposit])

    const getTime = (string) => {
        const date = new Date(string)
        const hour = date.getHours()
        const minute = date.getMinutes()
        const second = date.getSeconds()
        return `${hour}:${minute}:${second}`
    }

    console.log(proposal[0])

    const getStatus = () => {
        if (proposal[0].status === 3) {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: '#2A9D8F',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '5px',
                    marginRight: '0.5em',
                    marginLeft: '0.5em',
                }}>
                    Passed
                </span>)
        }
        else if (proposal[0].status === 4) {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: '#E76F51',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '5px',
                    marginRight: '0.5em',
                    marginLeft: '0.5em'
                }}>
                    Rejected
                </span>
            )
        }
        else if (proposal[0].status === 1) {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: 'rgba(0,207,232,.12)',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '5px',
                    marginRight: '0.5em',
                    marginLeft: '0.5em'
                }}>
                    Deposit
                </span>
            )
        }
        else {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: '#1D5470',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '5px',
                    marginRight: '0.5em',
                    marginLeft: '0.5em',
                }}>
                    Voting
                </span>
            )
        }
    }

    const handleClick = () => {
        setShow(true)
    }

    const handleClickCreateProposal = () => {
        setShowCreateProposal(true)
    }

    const handleEnter = (e) => {
        e.target.style.backgroundImage = 'Linear-Gradient(263.6deg, #4D4D4D 0%, #000000 100%)'
    }

    const handleLeave = (e) => {
        e.target.style.backgroundImage = 'Linear-Gradient(#EEC13F 0%, #FFAC38 100%)'
    }

    const handleClickDeposit = () => {
        wrapSetShowDeposit(true)
    }

    return (
        <div style={{
            padding: 70,
            paddingTop: '7em'
        }}>
            <div style={{
                display: 'flex',
                justifyContent: 'space-between'
            }}>
                <div style={{
                    textAlign: 'left',
                    fontSize: '36px',
                    color: '#ffffff',
                    fontFamily: 'montserrat',
                    fontWeight: 'bold',
                    marginBottom: '20px'
                }}>
                    DETAILS
                </div>
                <div>
                    <button
                        onClick={handleClickCreateProposal}
                        style={{
                            border: 'solid 2px #EEC13F',
                            backgroundImage: 'Linear-Gradient(#EEC13F 0%, #FFAC38 100%)',
                            color: '#ffffff',
                            fontWeight: 700,
                            fontSize: '24px',
                            padding: '10px 20px 10px 20px',
                            borderRadius: '10px'
                        }} onMouseOver={handleEnter} onMouseLeave={handleLeave}>
                        Create Proposal
                    </button>
                </div>
            </div>
            <div style={style.breadcrumb}>
                <span style={{ color: '#ffffff', fontWeight: 500 }}>
                    <Link to='/proposals' style={{ color: '#ffffff', fontWeight: 500 }}>
                        Proposals
                    </Link>
                </span>
                <span style={{ color: '#ffffff', fontWeight: 500 }}>
                    {' / '}
                </span>
                <span style={{ color: '#ED9D26' }}>
                    Details
                </span>
            </div>
            <div style={style.card}>
                <div style={style.content}>
                    <div style={style.title}>
                        <p className='title' style={style.title}>
                            <span style={{fontWeight: 'bold'}}>#{proposal.length > 0 && proposal[0].id}</span>
                            {proposal.length > 0 && getStatus()}
                            {proposal.length > 0 && proposal[0].content.value.title}
                        </p>
                    </div>
                    <div className="line" >
                        <p className="left">
                            Proposal ID
                        </p>
                        <p className="right">
                            {proposal.length > 0 && proposal[0].id || 0}
                        </p>
                    </div>
                    <div className="line">
                        <p className="left">
                            Proposer
                        </p>
                        <Link className="right" to={`/accounts/${proposer.proposer}`} style={{ textAlign: 'left' }}>
                            <p style={{ color: '#ED9D26' }}>
                                {proposer.proposer}
                            </p>
                        </Link>
                    </div>
                    <div className="line" >
                        <p className="left">
                            Total Deposit
                        </p>
                        <p className="right">
                            {proposal.length > 0 &&
                                proposal[0].total_deposit.length > 0 &&
                                parseInt(proposal[0].total_deposit[0].amount) / 1000000}
                        </p>
                    </div>
                    <div className="line">
                        <p className="left">
                            Submited Time
                        </p>
                        <p className="right">
                            {proposal.length > 0 &&
                                `${proposal[0].submit_time.split('T')[0]} ${getTime(proposal[0].submit_time)}`}
                        </p>
                    </div>
                    <div className="line" >
                        <p className="left">
                            Voting Time
                        </p>
                        <p className="right">
                            {proposal.length > 0 &&
                                `${proposal[0].voting_start_time.split('T')[0]} ${getTime(proposal[0].voting_start_time)}  -  ${proposal[0].voting_end_time.split('T')[0]} ${getTime(proposal[0].voting_end_time)}`}
                        </p>
                    </div>
                    <div className="line">
                        <p className="left">
                            Proposal Type
                        </p>
                        <p className="right">
                            {proposal.length > 0 && proposal[0].content.type}
                        </p>
                    </div>
                    <div className="line" >
                        <p className="left">
                            Title
                        </p>
                        <p className="right">
                            {proposal.length > 0 && proposal[0].content.value.title}
                        </p>
                    </div>
                    <div className="line">
                        <p className="left">
                            Description
                        </p>
                        <p className="right">
                            {proposal.length > 0 && proposal[0].content.value.description}
                        </p>
                    </div>
                    <div style={{ borderTop: 'solid 1.5px #ffffff' }} />
                    <div style={style.buttonBox}>
                        <Link to={`/proposals`}>
                            <button style={style.detail}>
                                Back to List
                            </button>
                        </Link>
                        {
                            proposal.length > 0 && proposal[0].status === 2 && (
                                <button style={style.extraButton} onClick={handleClick}>
                                    <RiBarChart2Fill style={{ fontSize: '1.5em' }} /> Vote
                                </button>
                            )
                        }
                        {
                            proposal.length > 0 && proposal[0].status === 1 && (
                                <button style={style.extraButton} onClick={handleClickDeposit}>
                                    <FaCoins style={{ marginRight: '5px' }} />Deposit
                                </button>
                            )
                        }
                    </div>
                </div>
            </div>
            <div style={{ ...style.voters}} >
                {proposal.length > 0 && <VoterList proposal={proposal[0]} />}
            </div>
            <Modal
                visible={show}
                footer={null}
                closable={false}
                onCancel={handleClose}
            >
                <div style={{
                        color: '#EEC13F',
                        fontFamily: 'montserrat',
                        fontSize: '24px',
                        fontWeight: 400,
                    }}>
                        <p>
                            Vote
                        </p>
                        {
                            proposal.length > 0 && 
                                <VoteModal 
                                    proposal={proposal[0]} 
                                    id={proposal[0].id} 
                                    wrapSetShow={wrapSetShow} 
                                />
                        }
                    </div>
            </Modal>
            <Modal
                visible={showDeposit}
                footer={null}
                closable={false}
                onCancel={handleCloseDeposit}
            >
                <div style={{
                        color: '#EEC13F',
                        fontFamily: 'montserrat',
                        fontSize: '24px',
                        fontWeight: 400,
                    }}>
                        <div>
                            Deposit
                            <p style={{
                                fontSize: '10px',
                                color: 'red'
                            }}>
                                *0x accounts are not supported yet
                            </p>
                        </div>
                        <DepositModal 
                            accounts={accounts} 
                            wrapSetShow={wrapSetShowDeposit} 
                            id={proposal.length > 0 && proposal[0].id || 0} 
                        />
                    </div>
            </Modal>
            <Modal
                visible={showCreateProposal}
                footer={null}
                closable={false}
                onCancel={handleCloseCreateProposal}
            >
                <div style={{
                        color: '#EEC13F',
                        fontFamily: 'montserrat',
                        fontSize: '24px',
                        fontWeight: 400,
                    }}>
                        <div>
                            Create Proposal
                            <p style={{
                                fontSize: '10px',
                                color: 'red'
                            }}>
                                *0x accounts are not supported yet
                            </p>
                        </div>
                        <CreateProposalModal 
                            accounts={accounts} 
                            wrapSetShow={wrapSetShowCreateProposal} 
                        />
                    </div>
            </Modal>
        </div>
    )
}

export default ProposalDetail
