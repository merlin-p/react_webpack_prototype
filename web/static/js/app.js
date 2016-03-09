import React from 'react';
import ReactDOM from 'react-dom';
import {Grid, Row, Col} from 'react-bootstrap';

class App extends React.Component {
  render() {
    return (
      <Grid>
        <Row>
          <Col md={4}>
            Test
          </Col>
          <Col md={4}>
            Test
          </Col>
        </Row>
      </Grid>
    )
 }
}

ReactDOM.render(<App />, document.getElementById('app'));
