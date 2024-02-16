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
	self:setLeftRight( true, false, 0, 332 )
	self:setTopBottom( true, false, 0, 80 )
	
	local warningIcon = LUI.UIImage.new()
	warningIcon:setLeftRight( true, false, 0, 32 )
	warningIcon:setTopBottom( true, false, 0, 32 )
	warningIcon:setImage( RegisterImage( "uie_warning_triangle" ) )
	self:addElement( warningIcon )
	self.warningIcon = warningIcon
	
	local DifficultyWarning = LUI.UIText.new()
	DifficultyWarning:setLeftRight( true, false, 37, 331 )
	DifficultyWarning:setTopBottom( true, false, 0, 25 )
	DifficultyWarning:setText( Engine.Localize( "CPUI_DIFFICULTY_CHANGE_INGAME_WARNING" ) )
	DifficultyWarning:setTTF( "fonts/default.ttf" )
	DifficultyWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultyWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultyWarning )
	self.DifficultyWarning = DifficultyWarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				warningIcon:completeAnimation()
				self.warningIcon:setAlpha( 1 )
				self.clipFinished( warningIcon, {} )
				DifficultyWarning:completeAnimation()
				self.DifficultyWarning:setAlpha( 1 )
				self.clipFinished( DifficultyWarning, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				warningIcon:completeAnimation()
				self.warningIcon:setAlpha( 0 )
				self.clipFinished( warningIcon, {} )
				DifficultyWarning:completeAnimation()
				self.DifficultyWarning:setAlpha( 0 )
				self.clipFinished( DifficultyWarning, {} )
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

