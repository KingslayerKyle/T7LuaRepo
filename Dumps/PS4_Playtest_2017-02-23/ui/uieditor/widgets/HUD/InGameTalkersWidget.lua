require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerWidgetCPZM" )

CoD.InGameTalkersWidget = InheritFrom( LUI.UIElement )
CoD.InGameTalkersWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InGameTalkersWidget )
	self.id = "InGameTalkersWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 130 )
	self.anyChildUsesUpdateState = true
	
	local Talkers = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	Talkers:makeFocusable()
	Talkers:setLeftRight( 0, 0, 0, 285 )
	Talkers:setTopBottom( 0, 0, -1, 131 )
	Talkers:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Talkers:setVerticalCount( 4 )
	Talkers:setSpacing( 8 )
	Talkers:setDataSource( "LoadingScreenPlayerListTeam1" )
	self:addElement( Talkers )
	self.Talkers = Talkers
	
	self.resetProperties = function ()
		Talkers:completeAnimation()
		Talkers:setLeftRight( 0, 0, 0, 285 )
		Talkers:setTopBottom( 0, 0, -1, 131 )
		Talkers:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Talkers:completeAnimation()
				self.Talkers:setAlpha( 0 )
				self.clipFinished( Talkers, {} )
			end
		},
		Safehouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Talkers:completeAnimation()
				self.Talkers:setLeftRight( 1, 1, -285, 0 )
				self.Talkers:setTopBottom( 1, 1, -130, 0 )
				self.clipFinished( Talkers, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				local f6_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
					f6_local0 = InSafehouse()
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	Talkers.id = "Talkers"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Talkers:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

