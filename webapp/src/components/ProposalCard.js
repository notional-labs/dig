import { FaArrowRight } from "react-icons/fa";
import '../assets/css/ProposalCard.css'
import {
    Link,
} from "react-router-dom";
import { useState, useEffect } from "react";
import { getTally } from "../helpers/getProposal"
import { RiBarChart2Fill } from "react-icons/ri";
import { FaCoins} from "react-icons/fa";
import { Skeleton } from 'antd';

const style = {
    card: {
        backgroundColor: 'transparent',
        borderRadius: '15px',
        minHeight: 'auto',
        fontFamily: 'montserrat',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-between',
        height: 'auto',
        border: 'solid 1px #EEC13F',
        color: '#ffffff'
    },
    timeBox: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginBottom: '1.5em',
        color: '#000000'
    },
    timeBoxContainer: {
        marginTop: '1.5em',
        paddingLeft: '2em',
        paddingRight: '2em',
    },
    title: {
        textAlign: 'left',
        fontWeight: 400,
        fontSize: '24px',
    },
    description: {
        textAlign: 'left',
        fontWeight: 300,
        fontSize: '15px',
    },
    timeCard: {
        backgroundColor: 'transparent',
        padding: '1em',
        borderRadius: '10px',
        color: '#ffffff',
        border: 'solid 1px #EEC13F',
    },
    buttonBox: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        backgroundColor: 'transparent',
        padding: '1em 2em 1em 2em',
        marginTop: '1.5em',
    },
    detail: {
        padding: '1em',
        borderRadius: '10px',
        fontWeight: 'bold',
        width: '100px',
        backgroundColor: '#ED9D27',
        color: '#ffffff',
        border: 0
    },
    extraButton: {
        padding: '1em',
        borderRadius: '10px',
        fontWeight: 'bold',
        backgroundColor: '#1D5470',
        color: '#ffffff',
        width: '100px',
        border: 0
    },
    time: {
        fontWeight: 'bold',
        color: '#0085ff'
    },
    voteBarContainer: {
        display: 'flex',
        justifyContent: 'center',
        minHeight: '20px',
        backgroundColor: '#CFCFCF',
        width: '100%'
    },
    voteBar: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'start',
        width: '100%',
        borderRadius: '50px',
        backgroundColor: '#CFCFCF',
        color: '#ffffff',
    }
}

const ProposalCard = ({ proposal, wrapSetShow, wrapSetSelect, wrapSetShowDeposit, index, bond }) => {
    const [loading, setLoading] = useState(false)

    useEffect(() => {
        (async () => {
            setLoading(true)
            if (proposal.status === 'PROPOSAL_STATUS_VOTING_PERIOD' || proposal.status === 'PROPOSAL_STATUS_DEPOSIT_PERIOD') {
                const tally = await getTally(proposal.proposal_id)
                proposal.tally = tally.result
            }
            setLoading(false)
        })()
    }, [])

    const getPercentage = (vote) => {
        if (proposal.tally !== undefined) {
            return bond !== 0 && parseFloat(parseFloat(vote) * 100 / bond).toFixed(1) || 0
        }
        else {
            return bond !== 0 && parseFloat(parseFloat(vote) * 100 / bond).toFixed(1) || 0
        }
    }

    const getStatus = () => {
        if (proposal.status === 'PROPOSAL_STATUS_PASSED') {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: '#2A9D8F',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '20%',
                    marginRight: '0.5em',
                    marginLeft: '0.5em',
                }}>
                    Passed
                </span>)
        }
        else if (proposal.status === 'PROPOSAL_STATUS_REJECTED') {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: '#E76F51',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '20%',
                    marginRight: '0.5em',
                    marginLeft: '0.5em'
                }}>
                    Rejected
                </span>
            )
        }
        else if (proposal.status === 'PROPOSAL_STATUS_DEPOSIT_PERIOD') {
            return (
                <span style={{
                    color: '#ffffff',
                    backgroundColor: 'rgba(0,207,232,.12)',
                    fontWeight: '400',
                    padding: '0.3em',
                    borderRadius: '20%',
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
                    borderRadius: '20%',
                    marginRight: '0.5em',
                    marginLeft: '0.5em',
                }}>
                    Voting
                </span>
            )
        }
    }

    const handleClick = () => {
        wrapSetShow(true)
        wrapSetSelect(index)
    }

    const handleClickDeposit = () => {
        wrapSetShowDeposit(true)
        wrapSetSelect(index)
    }

    return (
        !loading ? (
            <div style={style.card}>
                <div style={{ padding: '2em' }}>
                    <p className='title' style={style.title}>
                        <span style={{fontWeight: 'bold'}}>#{proposal.proposal_id}</span>
                        {getStatus()}
                        {proposal.content.title}
                    </p>
                    <div className="description" style={style.description}>
                        {proposal.content.description}
                    </div>
                </div>
                <div style={style.timeBoxContainer}>
                    <div style={style.timeBox}>
                        <div style={style.timeCard}>
                            <div>
                                Submit Date
                            </div>
                            <div >
                                {proposal.submit_time.split('T')[0]}
                            </div>
                        </div>
                        <div style={style.timeCard}>
                            <div>
                                Start Date
                            </div>
                            <div >
                                {proposal.voting_start_time.split('T')[0]}
                            </div>
                        </div>
                        <div style={style.timeCard}>
                            <div>
                                End Date
                            </div>
                            <div >
                                {proposal.voting_end_time.split('T')[0]}
                            </div>
                        </div>
                    </div>
                    <div style={style.voteBarContainer}>
                        <div style={style.voteBar}>
                            <div style={{
                                width: `${proposal.tally !== undefined
                                    ? getPercentage(proposal.tally.yes) :
                                    getPercentage(proposal.final_tally_result.yes)
                                    }%`,
                                backgroundColor: '#2A9D8F',
                                minHeight: '100%',
                            }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.yes) != 0.0
                                    && `${getPercentage(proposal.tally.yes)}%` :
                                    getPercentage(proposal.final_tally_result.yes) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.yes)}%`}
                            </div>
                            <div style={{
                                width: `${proposal.tally !== undefined
                                    ? getPercentage(proposal.tally.no) :
                                    getPercentage(proposal.final_tally_result.no)
                                    }%`,
                                backgroundColor: '#E9C46A',
                                minHeight: '100%'
                            }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.no) != 0.0
                                    && `${getPercentage(proposal.tally.no)}%` :
                                    getPercentage(proposal.final_tally_result.no) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.no)}%`}
                            </div>
                            <div style={{
                                width: `${proposal.tally !== undefined
                                    ? getPercentage(proposal.tally.abstain) :
                                    getPercentage(proposal.final_tally_result.abstain)
                                    }%`,
                                backgroundColor: '#9CB7D3',
                                minHeight: '100%',

                            }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.abstain) != 0.0
                                    && `${getPercentage(proposal.tally.abstain)}%` :
                                    getPercentage(proposal.final_tally_result.abstain) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.abstain)}%`}
                            </div>
                            <div style={{
                                width: `${proposal.tally !== undefined
                                    ? getPercentage(proposal.tally.no_with_veto) :
                                    getPercentage(proposal.final_tally_result.no_with_veto)
                                    }%`,
                                backgroundColor: '#E76F51',
                                minHeight: '100%',
                            }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.no_with_veto) != 0.0
                                    && `${getPercentage(proposal.tally.no_with_veto)}%` :
                                    getPercentage(proposal.final_tally_result.no_with_veto) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.no_with_veto)}%`}
                            </div>
                        </div>
                    </div>
                </div>
                <div style={style.buttonBox}>
                    <Link to={`${proposal.proposal_id}`}>
                        <button style={style.detail}>
                            Detail
                        </button>
                    </Link>
                    {
                        proposal.status === 'PROPOSAL_STATUS_VOTING_PERIOD' && (
                            <button style={style.extraButton} onClick={handleClick}>
                                <RiBarChart2Fill style={{ fontSize: '1.5em' }} /> Vote
                            </button>
                        )
                    }
                    {
                        proposal.status === 'PROPOSAL_STATUS_DEPOSIT_PERIOD' && (
                            <button style={style.extraButton} onClick={handleClickDeposit}>
                                <FaCoins style={{ marginRight: '3px' }} />Deposit
                            </button>
                        )
                    }
                </div>

            </div >
        ) : (
            <div style={{ ...style.card, padding: '2em' }}>
                <Skeleton active />
            </div>
        )
    )
}

export default ProposalCard