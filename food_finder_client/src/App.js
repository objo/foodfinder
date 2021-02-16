import "./App.css";

import Vendors from "./components/Vendors";

import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";

function App() {
  return (
    <Container>
      <Row className="top-row justify-content-md-center">
        <h1>Food Vendors</h1>
        <br />
        <br />
        <Container className="inner_body">
          <Vendors />
        </Container>
      </Row>
    </Container>
  );
}

export default App;
