import React, { Component } from 'react'
import axios from 'axios'

class App extends Component {
  state = { trips: [] }

  componentDidMount() {
    axios.get('/api/trips')
      .then( res => {
        this.setState({ trips: res.data })
        console.log(res.data)})
      .catch( error => console.log(error.message)
    )
  }

  delete_stop(t_id, s_id) {
    console.log('/api/trips/' + t_id + '/stops/' + s_id)
    axios.delete('/api/trips/' + t_id + '/stops/' + s_id)
      .then( res => {
        this.setState({ trips: res.data })
        console.log(res.data)})
      .catch (error => console.log(error.message)
    )
  }

  deleter(t_id, s_id) {
    console.log("Delete button clicked on trip id: " + t_id + ", stop id: " + s_id)
  }

  render() {
    const { trips } = this.state
    return (
      <div className="main">
        <h1>Trips Collection</h1>
        <hr />{'\n'}
          { trips.map( trip => 
            (
              <div key={trip.stop_id} className="trip">
                <b>{(trip.stop_id === 1 || (trip.stop_id - 1 ) % 10 === 0) ? trip.name : null }</b>
                <div className="stop">{trip.stop_id}:{trip.stop_name} - {trip.stop_address}
                  {' '}<button>Edit</button>
                  {' '}<button onClick={this.deleter(trip.id, trip.stop_id)}>Delete</button></div>
                  {(trip.stop_id === 10 || (trip.stop_id % 10 === 0)) ? "\n" : null}
              </div>

          ))}
      </div>
    )
  }
}

export default App