import dearpygui.dearpygui as dpg
from random import choices
import gachapy

pitycounter = 0
cardSet = ["SR","R","N"]

def tenroll():
    global pitycounter
    weights = [0.02+max(0, pitycounter/200-0.02), 0.48, 0.5-max(0, pitycounter/200-0.02)]
    rollresult = str(choices(cardSet, weights, k=10))
    if rollresult.count("SR") == 0:
        pitycounter += 10
        print(pitycounter)
    else:
        pitycounter = 0
        print(pitycounter)
    with dpg.popup(dpg.last_item(), mousebutton=dpg.mvMouseButton_Left, modal=True, tag="modal_id"):
        dpg.add_text(rollresult)
        dpg.add_button(label="Close", callback=lambda: dpg.configure_item("modal_id", show=False))

dpg.create_context()
dpg.create_viewport(title='Custom Title', width=600, height=300)

with dpg.window(label="Example Window"):
    dpg.add_button(label="ROLL", callback=tenroll)

dpg.setup_dearpygui()
dpg.show_viewport()
dpg.start_dearpygui()
dpg.destroy_context()