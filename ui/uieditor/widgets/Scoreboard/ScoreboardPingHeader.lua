-- a208b6f18f7f68ac83fc41b3d827afd5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

CoD.ScoreboardPingHeader = InheritFrom( LUI.UIElement )
CoD.ScoreboardPingHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPingHeader )
	self.id = "ScoreboardPingHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 38 )
	
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
	
	local ScoreColumn5Header = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5Header:setLeftRight( false, true, -61.5, 25.5 )
	ScoreColumn5Header:setTopBottom( true, false, 0, 32 )
	ScoreColumn5Header:setAlpha( 0 )
	ScoreColumn5Header:setScale( LanguageOverrideNumber( "fulljapanese", 0.7, LanguageOverrideNumber( "japanese", 0.7, 1 ) ) )
	ScoreColumn5Header.Bg:setRGB( 0.31, 0.31, 0.31 )
	ScoreColumn5Header.Bg:setAlpha( 0 )
	ScoreColumn5Header.Text:setRGB( 0.88, 0.89, 0.93 )
	ScoreColumn5Header.Text:setAlpha( 0.7 )
	ScoreColumn5Header.Text:setText( Engine.Localize( "CGAME_SB_PING" ) )
	ScoreColumn5Header.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5Header.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( ScoreColumn5Header )
	self.ScoreColumn5Header = ScoreColumn5Header
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Top3PlayerScoreBlurBox00:completeAnimation()
				self.Top3PlayerScoreBlurBox00:setAlpha( 1 )
				self.clipFinished( Top3PlayerScoreBlurBox00, {} )
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
				local f4_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
				if f4_local0 then
					f4_local0 = IsMapName( "zm_genesis" )
					if f4_local0 then
						f4_local0 = IsGenesisEECompleted( controller )
					end
				end
				return f4_local0
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
		element.ScoreColumn5Header:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

