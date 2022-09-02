-- 62697a6cae04252dacd2ea0a50e6a7b2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )

CoD.ScoreInfo_EnemyScorePanel = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_EnemyScorePanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_EnemyScorePanel )
	self.id = "ScoreInfo_EnemyScorePanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 159 )
	self:setTopBottom( true, false, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local PanelScale2 = CoD.ScoreInfo_PanelScale.new( menu, controller )
	PanelScale2:setLeftRight( false, false, -7, 89 )
	PanelScale2:setTopBottom( false, false, -18, 2 )
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
	PanelScale1:setLeftRight( false, false, -98, -5 )
	PanelScale1:setTopBottom( false, false, -18, 13 )
	PanelScale1:setRGB( 0.55, 0.58, 0.6 )
	self:addElement( PanelScale1 )
	self.PanelScale1 = PanelScale1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 18, 78 )
				self.PanelScale2:setTopBottom( false, false, 177, 208 )
				self.clipFinished( PanelScale2, {} )

				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -74, 20 )
				self.PanelScale1:setTopBottom( false, false, 177, 208 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Infect = {
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
				self.PanelScale2:setLeftRight( false, false, 0, 96 )
				self.PanelScale2:setTopBottom( false, false, -18, 2 )
				self.clipFinished( PanelScale2, {} )

				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -98, 0 )
				self.PanelScale1:setTopBottom( false, false, -18, 13 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 0, 96 )
				self.PanelScale2:setTopBottom( false, false, -18, 2 )
				self.clipFinished( PanelScale2, {} )

				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -98, 0 )
				self.PanelScale1:setTopBottom( false, false, -18, 13 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 0, 96 )
				self.PanelScale2:setTopBottom( false, false, -18, 2 )
				self.clipFinished( PanelScale2, {} )

				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -98, 0 )
				self.PanelScale1:setTopBottom( false, false, -18, 13 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 12, 108 )
				self.PanelScale2:setTopBottom( false, false, -18, 2 )
				self.clipFinished( PanelScale2, {} )

				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -98, 12 )
				self.PanelScale1:setTopBottom( false, false, -18, 13 )
				self.clipFinished( PanelScale1, {} )
			end
		},
		Count7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PanelScale2:completeAnimation()
				self.PanelScale2:setLeftRight( false, false, 25, 123 )
				self.PanelScale2:setTopBottom( false, false, -18, 2 )
				self.clipFinished( PanelScale2, {} )

				PanelScale1:completeAnimation()
				self.PanelScale1:setLeftRight( false, false, -98, 25 )
				self.PanelScale1:setTopBottom( false, false, -18, 13 )
				self.clipFinished( PanelScale1, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Infect",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "infect" )
			end
		},
		{
			stateName = "Count3",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 1000 )
			end
		},
		{
			stateName = "Count4",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 10000 )
			end
		},
		{
			stateName = "Count5",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 100000 )
			end
		},
		{
			stateName = "Count6",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 1000000 )
			end
		},
		{
			stateName = "Count7",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.enemyScore" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.enemyScore"
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

