CoD.CPDifficultyInGameChangeWarning = InheritFrom( LUI.UIElement )
CoD.CPDifficultyInGameChangeWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPDifficultyInGameChangeWarning )
	self.id = "CPDifficultyInGameChangeWarning"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 445 )
	self:setTopBottom( 0, 0, 0, 168 )
	
	local DifficultyWarning = LUI.UIText.new()
	DifficultyWarning:setLeftRight( 0, 0, 53, 441 )
	DifficultyWarning:setTopBottom( 0, 0, 7, 37 )
	DifficultyWarning:setText( Engine.Localize( "CPUI_DIFFICULTY_CHANGE_INGAME_WARNING" ) )
	DifficultyWarning:setTTF( "fonts/default.ttf" )
	DifficultyWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultyWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultyWarning )
	self.DifficultyWarning = DifficultyWarning
	
	local WarningTriangle = LUI.UIImage.new()
	WarningTriangle:setLeftRight( 0, 0, 8, 40 )
	WarningTriangle:setTopBottom( 1, 1, -162, -135 )
	WarningTriangle:setRGB( 0.95, 0.89, 0.03 )
	self:addElement( WarningTriangle )
	self.WarningTriangle = WarningTriangle
	
	self.resetProperties = function ()
		DifficultyWarning:completeAnimation()
		WarningTriangle:completeAnimation()
		DifficultyWarning:setAlpha( 1 )
		WarningTriangle:setAlpha( 1 )
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
				self:setupElementClipCounter( 2 )
				DifficultyWarning:completeAnimation()
				self.DifficultyWarning:setAlpha( 0 )
				self.clipFinished( DifficultyWarning, {} )
				WarningTriangle:completeAnimation()
				self.WarningTriangle:setAlpha( 0 )
				self.clipFinished( WarningTriangle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsInGame()
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

