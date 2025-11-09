require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.scoreboardPingBackground = InheritFrom( LUI.UIElement )
CoD.scoreboardPingBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scoreboardPingBackground )
	self.id = "scoreboardPingBackground"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Top3PlayerScoreBlurBox00 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox00:setLeftRight( true, true, 0, 0 )
	Top3PlayerScoreBlurBox00:setTopBottom( true, true, 0, 0 )
	Top3PlayerScoreBlurBox00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox00:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox00 )
	self.Top3PlayerScoreBlurBox00 = Top3PlayerScoreBlurBox00
	
	local VSpanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel0:setLeftRight( true, true, 0, 0 )
	VSpanel0:setTopBottom( true, true, 0, 0 )
	VSpanel0:setRGB( 0, 0, 0 )
	VSpanel0:setAlpha( 0.45 )
	self:addElement( VSpanel0 )
	self.VSpanel0 = VSpanel0
	
	local PingBars = LUI.UIImage.new()
	PingBars:setLeftRight( false, true, -29.5, -7.67 )
	PingBars:setTopBottom( false, false, -10.92, 10.92 )
	PingBars:linkToElementModel( self, "ping", true, function ( model )
		local ping = Engine.GetModelValue( model )
		if ping then
			PingBars:setImage( RegisterImage( GetScoreboardPlayerPingBarImage( ping ) ) )
		end
	end )
	self:addElement( PingBars )
	self.PingBars = PingBars
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Top3PlayerScoreBlurBox00:completeAnimation()
				self.Top3PlayerScoreBlurBox00:setAlpha( 1 )
				self.clipFinished( Top3PlayerScoreBlurBox00, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		GenesisEndGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Top3PlayerScoreBlurBox00:completeAnimation()
				self.Top3PlayerScoreBlurBox00:setAlpha( 0 )
				self.clipFinished( Top3PlayerScoreBlurBox00, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "GenesisEndGame",
			condition = function ( menu, element, event )
				local f6_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
				if f6_local0 then
					f6_local0 = IsMapName( "zm_genesis" )
					if f6_local0 then
						f6_local0 = IsGenesisEECompleted( controller )
					end
				end
				return f6_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Top3PlayerScoreBlurBox00:close()
		element.VSpanel0:close()
		element.PingBars:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

