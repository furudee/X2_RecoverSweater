class X2EventListener_RecoverSweater extends X2EventListener;

// This was an attempt to dynamically spawn the sweater and attach it to the stasis suit,
// but the sweater didn't move with the suit in matinee, I'm too stupid to rotate the sweater correctly
// and couldn't find a way to hide the suit
// So now I have to ship the map files and animation package...

/*
static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;

	Templates.AddItem(Create_Test_Template());

    return Templates;
}

static function CHEventListenerTemplate Create_Test_Template()
{
    local CHEventListenerTemplate Template;

    `CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'FURUTESTTEMPLATE');

    Template.RegisterInTactical = true;

    Template.AddCHEvent('KismetGameStateMatinee', OnKismetGameStateMatinee, ELD_OnVisualizationBlockStarted, 50);

    return Template;
}

static protected function EventListenerReturn OnKismetGameStateMatinee(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameStateContext_Kismet Kismet;
	local SeqAct_PlayGameStateMatinee Sequence;
	local XComGameState_Unit UnitState;
	local SeqVarLink VarLink;
	local SeqVar_GameUnit UnitVar;
	local XGUnit UnitVisualizer;
	local XComUnitPawn UnitPawn;
	local StaticMesh SweaterMesh;
	local KActorSpawnable SweaterActor;
	local Vector Location;
	local Rotator Rotation;
	local AnimTree AnimTreeTemplate;
	local RenderChannelContainer RenderChannels;

	
	Kismet = XComGameStateContext_Kismet(GameState.GetContext());
	Sequence = SeqAct_PlayGameStateMatinee(Kismet.FindSequenceOp());

	if(Sequence.MatineeComment == "ForgeRecoverStatisSuit")
	{
			foreach Sequence.VariableLinks(VarLink)
			{
				if(VarLink.LinkDesc == "Avatar")
				{
					UnitVar = VarLink.LinkedVariables.Length > 0 ? SeqVar_GameUnit(VarLink.LinkedVariables[0]) : none;

					if(UnitVar != none && UnitVar.IntValue > 0)
					{
						UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(UnitVar.IntValue));
						break;
					}
				}
			}

			if(UnitState != None)
			{
				UnitVisualizer = XGUnit(UnitState.FindOrCreateVisualizer(GameState));
				if(UnitVisualizer != None)
				{
					SweaterMesh = StaticMesh(`CONTENT.RequestGameArchetype("FuruSweater.Meshes.FuruSweater"));
					if(SweaterMesh != None)
					{
						UnitPawn = UnitVisualizer.GetPawn();

						SweaterActor = `LOCALPLAYERCONTROLLER.Spawn(class'KActorSpawnable');
						SweaterActor.SetStaticMesh(SweaterMesh);
						SweaterActor.SetPhysics(PHYS_Interpolating);

						SweaterActor.SetLocation(UnitPawn.Mesh.GetBoneLocation('Ribcage',0));
						SweaterActor.SetRotation(UnitPawn.Mesh.GetRotation());

						SweaterActor.SetBase(UnitPawn,, UnitPawn.Mesh, 'Ribcage');
						SweaterActor.SetHardAttach(true);

						// i give up...

						AnimTreeTemplate = AnimTree(DynamicLoadObject("Soldier_ANIMTREE.AT_SoldierCustom_CIN", class'AnimTree'));
						UnitPawn.Mesh.SetAnimTreeTemplate(AnimTreeTemplate);

						RenderChannels = UnitPawn.Mesh.RenderChannels;
						RenderChannels.MainScene = false;
						UnitPawn.Mesh.SetRenderChannels(RenderChannels);

						UnitPawn.SetVisible(false);
						UnitPawn.Mesh.SetHidden(true);

						//UnitPawn.Mesh.TransformToBoneSpace('Ribcage', SweaterActor.Location, SweaterActor.Rotation, Location, Rotation);
						//UnitPawn.Mesh.AttachComponent(SweaterActor.StaticMeshComponent, 'Ribcage', Location, Rotation);

						//UnitVisualizer.SetHidden(true);
						//UnitPawn.SetHidden(true);
						//UnitPawn.Mesh.SetHidden(true);
						//UnitPawn.Mesh.SetOnlyOwnerSee(true);
						//UnitPawn.Mesh.SetOwnerNoSee(true);

						//UnitPawn.Mesh.SetIgnoreOwnerHidden(true);

						//SweaterActor.SetHidden(false);
						//SweaterActor.StaticMeshComponent.SetHidden(false);
						//SweaterActor.StaticMeshComponent.SetIgnoreOwnerHidden(true);

						//UnitPawn.SetVisible(false);

						`SHAPEMGR.DrawDebugSphere(SweaterActor.Location, 20, 20, 255,255,255, true);

					}
				}

			}

	}

	return ELR_NoInterrupt;
}
*/