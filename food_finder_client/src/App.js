import "./App.css";

import Vendors from "./components/Vendors";

import "react-toastify/dist/ReactToastify.css";

import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import { ToastContainer } from "react-toastify";

function App() {
  return (
    <Container>
      <ToastContainer autoClose={3000} hideProgressBar />
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
