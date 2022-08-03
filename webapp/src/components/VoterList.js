import { useEffect, useState } from "react"
import { getVotes } from "../helpers/getProposal"
import { Typography, Tooltip, Skeleton } from 'antd';
import { Modal } from 'react-bootstrap';
import { Link } from 'react-router-dom';

const { Title, Paragraph } = Typography;

const style = {
    voteBarContainer: {
        display: 'flex',
        justifyContent: 'center',
        minHeight: '40px',
        marginBottom: '1em',
        color: '#ffffff',
        paddingTop: 0,
        backgroundColor: '#CFCFCF',
    },
    voteBar: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'start',
        borderRadius: '50px',
        width: '100%',
        backgroundColor: '#CFCFCF',
    },
    container: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        paddingTop: 50,
    },
    table: {
        width: '100%',
    },
    tdlHeader: {
        backgroundColor: 'transparent',
        borderBottom: 'solid 1px #ffffff'
    },
    tdlContent: {
        marginTop: '0px',
        borderRadius: '50px',
        paddingTop: 0
    },
    th: {
        padding: '15px 15px',
        textAlign: 'left',
        fontWeight: 'bold',
        fontSize: '24px',
        color: '#ffffff',
        textTransform: 'uppercase',
        fontFamily: 'montserrat',
    },
    td: {
        padding: '15px',
        textAlign: 'left',
        verticalAlign: '500',
        fontWeight: 'lighter',
        fontSize: '17px',
        color: '#ffffff',
        fontFamily: 'montserrat',
        width: '20%',
        lineHeight: '18px'
    }
}

const VoterList = ({ proposal }) => {
    const [loading, setLoading] = useState(false)
    const [voters, setVoters] = useState([])

    useEffect(() => {
        (async () => {
            setLoading(true)
            const res = await getVotes(proposal.id)
            const voters = res.votes
            setVoters([...voters])
            setLoading(false)
        })()
    }, [])

    const getPercentage = (vote) => {
        if (proposal.tally !== undefined) {
            const sum = parseInt(proposal.tally.yes)
                + parseInt(proposal.tally.no_with_veto)
                + parseInt(proposal.tally.no)
                + parseInt(proposal.tally.abstain)

            return sum !== 0 && parseFloat(parseInt(vote) * 100 / sum).toFixed(1) || 0
        }
        else {
            const sum = parseInt(proposal.final_tally_result.yes)
                + parseInt(proposal.final_tally_result.no_with_veto)
                + parseInt(proposal.final_tally_result.no)
                + parseInt(proposal.final_tally_result.abstain)

            return sum !== 0 && parseFloat(parseInt(vote) * 100 / sum).toFixed(1) || 0
        }
    }

    const getOption = (option) => {
        if (option === 'VOTE_OPTION_NO') return 'No'
        if (option === 'VOTE_OPTION_YES') return 'Yes'
        if (option === 'VOTE_OPTION_NO_WITH_VETO') return 'No With Veto'
        else return 'Abstain'
    }

    return (
        <div style={{
            borderRadius: '10px',
        }}>
            <div style={style.container}>
                <Title style={{ color: '#ED9D26', fontSize: '36px', fontWeight: 'bold', fontFamily: 'montserrat' }}>
                    Voters
                </Title>
            </div>
            <div style={{ border: 'solid 2px #EEC13F', padding: '2em', borderRadius: '10px' }}>
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
                            <p style={{ marginTop: '10px' }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.yes) != 0.0
                                    && `${getPercentage(proposal.tally.yes)}%` :
                                    getPercentage(proposal.final_tally_result.yes) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.yes)}%`}
                            </p>
                        </div>
                        <div style={{
                            width: `${proposal.tally !== undefined
                                ? getPercentage(proposal.tally.no) :
                                getPercentage(proposal.final_tally_result.no)
                                }%`,
                            backgroundColor: '#E9C46A',
                            minHeight: '100%'
                        }}>
                            <p style={{ marginTop: '10px' }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.no) != 0.0
                                    && `${getPercentage(proposal.tally.no)}%` :
                                    getPercentage(proposal.final_tally_result.no) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.no)}%`}
                            </p>
                        </div>
                        <div style={{
                            width: `${proposal.tally !== undefined
                                ? getPercentage(proposal.tally.abstain) :
                                getPercentage(proposal.final_tally_result.abstain)
                                }%`,
                            backgroundColor: '#9CB7D3',
                            minHeight: '100%',

                        }}>
                            <p style={{ marginTop: '10px' }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.abstain) != 0.0
                                    && `${getPercentage(proposal.tally.abstain)}%` :
                                    getPercentage(proposal.final_tally_result.abstain) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.abstain)}%`}
                            </p>
                        </div>
                        <div style={{
                            width: `${proposal.tally !== undefined
                                ? getPercentage(proposal.tally.no_with_veto) :
                                getPercentage(proposal.final_tally_result.no_with_veto)
                                }%`,
                            backgroundColor: '#E76F51',
                            minHeight: '100%',
                        }}>
                            <p style={{ marginTop: '10px' }}>
                                {proposal.tally !== undefined ? getPercentage(proposal.tally.no_with_veto) != 0.0
                                    && `${getPercentage(proposal.tally.no_with_veto)}%` :
                                    getPercentage(proposal.final_tally_result.no_with_veto) != 0.0
                                    && `${getPercentage(proposal.final_tally_result.no_with_veto)}%`}
                            </p>
                        </div>
                    </div>
                </div>
                {!loading ? proposal.status < 3 && (
                <div style={{ borderRadius: '10px', paddingTop: '30px'}}>
                    <table cellPadding="0" cellSpacing="0" border="0" style={style.table}>
                        <thead style={style.tdlHeader}>
                            <tr>
                                <th style={{ ...style.th, width: '20%' }}>Voter</th>
                                <th style={{ ...style.th, width: '10rem' }}>Option</th>
                            </tr>
                        </thead>
                        <tbody style={style.tdlContent}>
                            {voters.map((vote, index) => {
                                return (
                                    <tr key={index}>
                                        <td style={style.td}>
                                            <Link to={`../accounts/${vote.voter}`}>
                                                {vote.voter}
                                            </Link>
                                        </td>
                                        <td style={style.td}>
                                            {vote.option && getOption(vote.option)}
                                        </td>
                                    </tr>
                                )
                            })}
                        </tbody>
                    </table>
                </div>
            ) : (
                <div style={{paddingTop: '30px'}}>
                    <Skeleton active />
                </div>
            )}
            </div>
        </div>
    )
}

export default VoterList