-- ce6e846d0a7608546371d101aed4c12e
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 87 )
	self.anyChildUsesUpdateState = true
	
	local Talkers = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	Talkers:makeFocusable()
	Talkers:setLeftRight( true, false, 0, 190 )
	Talkers:setTopBottom( true, false, 0, 87 )
	Talkers:setDataSource( "LoadingScreenPlayerListTeam1" )
	Talkers:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Talkers:setVerticalCount( 4 )
	Talkers:setSpacing( 5 )
	self:addElement( Talkers )
	self.Talkers = Talkers
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Talkers:completeAnimation()
				self.Talkers:setAlpha( 0 )
				self.clipFinished( Talkers, {} )
			end
		},
		Safehouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Talkers:completeAnimation()
				self.Talkers:setLeftRight( false, true, -190, 0 )
				self.Talkers:setTopBottom( false, true, -87, 0 )
				self.Talkers:setAlpha( 1 )
				self.clipFinished( Talkers, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Talkers:completeAnimation()
				self.Talkers:setAlpha( 1 )
				self.clipFinished( Talkers, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				local f5_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
					f5_local0 = InSafehouse()
				else
					f5_local0 = false
				end
				return f5_local0
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Talkers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
