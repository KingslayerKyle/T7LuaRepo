-- 0321896e9c915f8d858520bbafb5f860
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimHUDContainer" )
require( "ui.uieditor.widgets.HUD.CP_TrainingSim.TrainingSim_CombatImmersionCompleted" )
require( "ui.uieditor.widgets.HUD.CP_TrainingSim.TrainingSim_RoundCompleteWidget" )

local PostLoadFunc = function ( self, controller, menu )
	self.ServerTime0:subscribeToModel( Engine.GetModel( self:getModel(), "roundStartTime" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.ServerTime0:setupServerTime( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ServerTime0:close()
	end )
end

LUI.createMenu.TrainingSim = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TrainingSim" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TrainingSim.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local CPTrainingSimHUDContainer = CoD.CPTrainingSimHUDContainer.new( f4_local1, controller )
	CPTrainingSimHUDContainer:setLeftRight( true, false, 22, 288 )
	CPTrainingSimHUDContainer:setTopBottom( true, false, 557.28, 699 )
	CPTrainingSimHUDContainer:setXRot( 15 )
	CPTrainingSimHUDContainer:setYRot( 40 )
	self:addElement( CPTrainingSimHUDContainer )
	self.CPTrainingSimHUDContainer = CPTrainingSimHUDContainer
	
	local ServerTime0 = LUI.UITightText.new()
	ServerTime0:setLeftRight( true, false, 59, 122.96 )
	ServerTime0:setTopBottom( true, false, 584.56, 603.56 )
	ServerTime0:setXRot( 15 )
	ServerTime0:setYRot( 40 )
	ServerTime0:setTTF( "fonts/escom.ttf" )
	ServerTime0:setupServerTime( Negate( 1 ) )
	self:addElement( ServerTime0 )
	self.ServerTime0 = ServerTime0
	
	local CombatImmersionCompleted = CoD.TrainingSim_CombatImmersionCompleted.new( f4_local1, controller )
	CombatImmersionCompleted:setLeftRight( true, false, 342.59, 937.41 )
	CombatImmersionCompleted:setTopBottom( true, false, 300.27, 370.73 )
	self:addElement( CombatImmersionCompleted )
	self.CombatImmersionCompleted = CombatImmersionCompleted
	
	local RoundComplete = CoD.TrainingSim_RoundCompleteWidget.new( f4_local1, controller )
	RoundComplete:setLeftRight( false, false, -382.8, 382.8 )
	RoundComplete:setTopBottom( false, false, -59.73, 10.7 )
	RoundComplete:linkToElementModel( self, nil, false, function ( model )
		RoundComplete:setModel( model, controller )
	end )
	self:addElement( RoundComplete )
	self.RoundComplete = RoundComplete
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CombatImmersionCompleted:completeAnimation()
				self.CombatImmersionCompleted:setAlpha( 0 )
				self.clipFinished( CombatImmersionCompleted, {} )
				RoundComplete:completeAnimation()
				self.RoundComplete:setAlpha( 0 )
				self.clipFinished( RoundComplete, {} )
			end,
			round_complete = function ()
				self:setupElementClipCounter( 2 )
				CombatImmersionCompleted:completeAnimation()
				self.CombatImmersionCompleted:setAlpha( 0 )
				self.clipFinished( CombatImmersionCompleted, {} )
				RoundComplete:completeAnimation()
				self.RoundComplete:setAlpha( 1 )
				self.clipFinished( RoundComplete, {} )
			end,
			immersion_complete = function ()
				self:setupElementClipCounter( 2 )
				CombatImmersionCompleted:completeAnimation()
				self.CombatImmersionCompleted:setAlpha( 1 )
				self.clipFinished( CombatImmersionCompleted, {} )
				RoundComplete:completeAnimation()
				self.RoundComplete:setAlpha( 0 )
				self.clipFinished( RoundComplete, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f9_local0 = self
		if IsParamModelEqualToString( model, "training_sim_round_complete" ) then
			PlayClipOnElement( self, {
				elementName = "RoundComplete",
				clipName = "DefaultClip"
			}, controller )
			PlayClip( self, "round_complete", controller )
		elseif IsParamModelEqualToString( model, "training_sim_complete" ) then
			PlayClipOnElement( self, {
				elementName = "CombatImmersionCompleted",
				clipName = "DefaultClip"
			}, controller )
			PlayClip( self, "immersion_complete", controller )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPTrainingSimHUDContainer:close()
		element.CombatImmersionCompleted:close()
		element.RoundComplete:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TrainingSim.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

