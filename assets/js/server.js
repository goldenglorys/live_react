// Used by the node.js worker for server-side rendering
import components from "../react-components";
import { getRender } from "live_react/server";

export const render = getRender(components);
