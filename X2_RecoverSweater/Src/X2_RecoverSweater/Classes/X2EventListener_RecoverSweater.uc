class X2EventListener_RecoverSweater extends X2EventListener;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;

	Templates.AddItem(Create_Sweater_Template());

    return Templates;
}

static function CHEventListenerTemplate Create_Sweater_Template()
{
    local CHEventListenerTemplate Template;

    `CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'FuruRecoverSweater');

    Template.RegisterInTactical = true;

    Template.AddCHEvent('OnCreateCinematicPawn', PostOnCreateCinematicPawn, ELD_Immediate, 50);

    return Template;
}

static protected function EventListenerReturn PostOnCreateCinematicPawn(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Kismet Kismet;
	local SeqAct_PlayGameStateMatinee Sequence, Matinee;
	local XComGameState_Unit UnitState;
	local XComUnitPawn UnitPawn;
	local StaticMesh SweaterMesh;
	local KActorSpawnable SweaterActor;
	local Vector Location;
	local Rotator Rotation;

	History = `XCOMHISTORY;
	UnitPawn = XComUnitPawn(EventData);
	UnitState = XComGameState_Unit(EventSource);

	// return early if it isn't the pawn we want
	if(UnitState.GetMyTemplateName() != 'StasisSuitVIP')
	{
		return ELR_NoInterrupt;
	}

	// find the correct matinee
	foreach History.IterateContextsByClassType(class'XComGameStateContext_Kismet', Kismet)
	{
		Sequence = SeqAct_PlayGameStateMatinee(Kismet.FindSequenceOp());

		if(Sequence != None && Sequence.MatineeComment == "ForgeRecoverStatisSuit")
		{
			Matinee = Sequence;
			break;
		}
	}

	// spawn the sweater, assign the mesh and attach it to the pawn
	if(Matinee != None)
	{
		SweaterMesh = StaticMesh(`CONTENT.RequestGameArchetype("FuruSweater.Meshes.FuruSweater"));
		if(SweaterMesh != None)
		{
			SweaterActor = `LOCALPLAYERCONTROLLER.Spawn(class'KActorSpawnable');
			if(SweaterActor != None)
			{
				SweaterActor.SetStaticMesh(SweaterMesh);
				SweaterActor.SetPhysics(PHYS_Interpolating);

				SweaterActor.SetLocation(UnitPawn.Mesh.GetBoneLocation('Ribcage',0));
				SweaterActor.SetRotation(UnitPawn.Mesh.GetRotation());

				UnitPawn.Mesh.TransformToBoneSpace('Ribcage', SweaterActor.Location, SweaterActor.Rotation, Location, Rotation);
				UnitPawn.Mesh.AttachComponent(SweaterActor.StaticMeshComponent, 'Ribcage', Location, Rotation);

				// lastly hide the pawn mesh so only sweater shows
				UnitPawn.Mesh.SetHidden(true);
			}
		}
	}

	return ELR_NoInterrupt;
}
