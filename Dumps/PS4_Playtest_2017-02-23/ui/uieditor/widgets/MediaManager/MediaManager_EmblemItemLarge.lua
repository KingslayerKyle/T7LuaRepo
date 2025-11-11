require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", true )
	Engine.CreateModel( rootModel, "isBuyMoreSlot", true )
end

CoD.MediaManager_EmblemItemLarge = InheritFrom( LUI.UIElement )
CoD.MediaManager_EmblemItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MediaManager_EmblemItemLarge )
	self.id = "MediaManager_EmblemItemLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 322 )
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 0, -3, 528 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, -3, 325 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local DrawEmblem = LUI.UIElement.new()
	DrawEmblem:setLeftRight( 0, 0, 0, 525 )
	DrawEmblem:setTopBottom( 0, 0, 0, 322 )
	DrawEmblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DrawEmblem:setupEmblem( modelValue )
		end
	end )
	self:addElement( DrawEmblem )
	self.DrawEmblem = DrawEmblem
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, -3, 528 )
	StartMenuframenoBG0:setTopBottom( 0, 0, -3, 325 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.resetProperties = function ()
		DrawEmblem:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		DrawEmblem:setAlpha( 1 )
		StartMenuframenoBG0:setAlpha( 0.85 )
		BoxButtonLrgIdle:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				DrawEmblem:completeAnimation()
				self.DrawEmblem:setAlpha( 0 )
				self.clipFinished( DrawEmblem, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not MediaManagerSlotsUsed( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.StartMenuframenoBG0:close()
		self.DrawEmblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

