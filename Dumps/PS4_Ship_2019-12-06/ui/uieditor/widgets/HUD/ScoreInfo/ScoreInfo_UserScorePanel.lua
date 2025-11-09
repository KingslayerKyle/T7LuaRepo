require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )

CoD.ScoreInfo_UserScorePanel = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_UserScorePanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_UserScorePanel )
	self.id = "ScoreInfo_UserScorePanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 223 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local PanelScale2 = CoD.ScoreInfo_PanelScale.new( menu, controller )
	PanelScale2:setLeftRight( false, false, -39, 57 )
	PanelScale2:setTopBottom( false, false, -4, 14 )
	PanelScale2:setRGB( 0.55, 0.58, 0.6 )
	PanelScale2:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return HideScoreMeterDueToGameType()
			end
		}
	} )
	self:addElement( PanelScale2 )
	self.PanelScale2 = PanelScale2
	
	local PanelScale1 = CoD.ScoreInfo_PanelScale.new( menu, controller )
	PanelScale1:setLeftRight( false, false, -124, -39 )
	PanelScale1:setTopBottom( false, false, -22, 14 )
	PanelScale1:setRGB( 0.55, 0.58, 0.6 )
	self:addElement( PanelScale1 )
	self.PanelScale1 = PanelScale1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, -44.5, 15.5 )
				self.PanelScale2:setTopBottom( false, false, 391, 422 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -124, -42.5 )
				self.PanelScale1:setTopBottom( false, false, 386, 422 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Infected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setAlpha( 0 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setAlpha( 0 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, -34, 62 )
				self.PanelScale2:setTopBottom( false, false, -4, 14 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -124, -34 )
				self.PanelScale1:setTopBottom( false, false, -22, 14 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, -14, 82 )
				self.PanelScale2:setTopBottom( false, false, -4, 14 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -124, -14 )
				self.PanelScale1:setTopBottom( false, false, -22, 14 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 6, 103 )
				self.PanelScale2:setTopBottom( false, false, -4, 14 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -124, 6 )
				self.PanelScale1:setTopBottom( false, false, -22, 14 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 26, 122 )
				self.PanelScale2:setTopBottom( false, false, -4, 14 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -124, 26 )
				self.PanelScale1:setTopBottom( false, false, -22, 14 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 46, 142 )
				self.PanelScale2:setTopBottom( false, false, -4, 14 )
				self.clipFinished( PanelScale2, {} )
				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -124, 46 )
				self.PanelScale1:setTopBottom( false, false, -22, 14 )
				self.clipFinished( PanelScale1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Infected",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "infect" )
			end
		},
		{
			stateName = "Count3",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 1000 )
			end
		},
		{
			stateName = "Count4",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 10000 )
			end
		},
		{
			stateName = "Count5",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 100000 )
			end
		},
		{
			stateName = "Count6",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 1000000 )
			end
		},
		{
			stateName = "Count7",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.playerScore" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.playerScore"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelScale2:close()
		element.PanelScale1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

