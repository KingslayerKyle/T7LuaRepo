-- a1c53656b8be7905459e5bc3d2b54443
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 297 )
	self:setTopBottom( true, false, 0, 112 )
	
	local DifficultyWarning = LUI.UIText.new()
	DifficultyWarning:setLeftRight( true, false, 35, 294 )
	DifficultyWarning:setTopBottom( true, false, 5, 25 )
	DifficultyWarning:setText( Engine.Localize( "CPUI_DIFFICULTY_CHANGE_INGAME_WARNING" ) )
	DifficultyWarning:setTTF( "fonts/default.ttf" )
	DifficultyWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultyWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultyWarning )
	self.DifficultyWarning = DifficultyWarning
	
	local WarningTriangle = LUI.UIImage.new()
	WarningTriangle:setLeftRight( true, false, 5.5, 27 )
	WarningTriangle:setTopBottom( false, true, -108, -90 )
	WarningTriangle:setRGB( 0.95, 0.89, 0.03 )
	WarningTriangle:setImage( RegisterImage( "uie_warning_triangle" ) )
	self:addElement( WarningTriangle )
	self.WarningTriangle = WarningTriangle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				DifficultyWarning:completeAnimation()
				self.DifficultyWarning:setAlpha( 1 )
				self.clipFinished( DifficultyWarning, {} )

				WarningTriangle:completeAnimation()
				self.WarningTriangle:setAlpha( 1 )
				self.clipFinished( WarningTriangle, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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
