import { Outlet } from "react-router-dom";

import Header from "../Header";
import Footer from "../Footer/Footer";
export const AuthGuard = () => {
    return (
        <div className="app">
            <Header />
            <main className="main-content">
                <Outlet />
            </main>
            {/* <Footer /> */}
        </div>
    )
}

export default AuthGuard;