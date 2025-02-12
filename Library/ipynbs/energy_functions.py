def calcE(G_ox,G_red,n=1):
    """ 
    Calculations the redox potential of a reaction using dG=-nFE-4.28 to calculate vs SHE.
    4.28 is SHE vs vacuum.

    Arguments:
    G_ox (int): Gibbs free energy of oxidized species in hartree references to vacuum.
    G_red (int): Gibbs free energy of reduced species in hartree references to vacuum.

    Returns:
    E vs SHE (int): Redox potential in volts references vs SHE. 

    """  
    F=96485 #Faraday's constant [=] C/mol
    dG=G_ox-G_red
    E= dG*2625.5*1000/(n*F) - 4.28 #Volts
    return E




def calcDPFE(G_ylide_h,G_ylide,solvent='gas',functional='M062X',basis='Def2SVPD'):
    """ 
    Calculations the deprotonation Free Energy of a reaction, specifically going from ylide_h to ylide

    Arguments:
    ylide_h (int): Gibbs free energy of protonated ylide in hartree references to vacuum.
    ylide (int): Gibbs free energy of ylide in hartree references to vacuum.

    Returns:
    DPFE (int): Deprotonation Free Energy in kJ/mol. 

    """ 
    
    #Dictionaory of H+ energies at the M062X 
    proton_dict={
        'M062X':{
            'Def2TZVP':{
            'acetonitrile': -0.223572
            },

            'Def2SVPD':{ 

             'acetonitrile':  -0.223572
            }
        }
    }
    
    possible_solvents=[functional][basis]['gas','acetonitrile']
    assert solvent in possible_solvents, "VALID SOLVENT NOT SPECIFIED"
    
    return -(G_ylide_h-G_ylide-proton_dict[solvent])*2625.5    


def calcGHBind(G_ylide_h,G_ylide_rad,functional='M062X',basis='Def2SVPD',solvent='gas',energy_type ='h2'):
    """ 
    Calculations the Hydrogen atom Binding Energy of a reaction, specifically going from ylide_rad to ylide_h

    Arguments:
    ylide_h (int): Gibbs free energy of protonated ylide in hartree references to vacuum.
    ylide_rad (int): Gibbs free energy of ylide radical in hartree references to vacuum.

    Returns:
    GHBind (int): Hydrogen Atom Binding energy of an ylide in kJ/mol. 

    """ 
    
    #Dictionaory of H atom energies at the M062X 
    H_atom_energy_dict={
        'M062X':{
            'Def2TZVP':{
            'acetonitrile': -0.406533
            },

            '6311++G**':{

            'acetonitrile':  -0.508484
            },

            'Def2SVPD':{ 

             'acetonitrile':  -0.507603
            }
        }
    }
    
    
    H2_dict={
    'gas': -1.169741,
    'acetonitrile':-1.169345
    }
    
    possible_solvents=['gas','acetonitrile']
    
    assert solvent in possible_solvents, "VALID SOLVENT NOT SPECIFIED"
    
    
    if energy_type == 'h2':
        return (G_ylide_h-G_ylide_rad-H2_dict[solvent]/2)*2625.5
    elif: energy_type =='radical'
        return (G_ylide_h-G_ylide_rad-H_atom_energy_dict[functional][basis][solvent])*2625.5