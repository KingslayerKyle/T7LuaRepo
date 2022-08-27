-- 0a30958fbce1cef3195bcb4c11a1efbe
-- This hash is used for caching, delete to decompile the file again

CoD.codcaster_ScoreLogoWidget_FFA = InheritFrom( LUI.UIElement )
CoD.codcaster_ScoreLogoWidget_FFA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.codcaster_ScoreLogoWidget_FFA )
	self.id = "codcaster_ScoreLogoWidget_FFA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 210 )
	self:setTopBottom( true, false, 0, 67 )
	
	local teamcolor = LUI.UIImage.new()
	teamcolor:setLeftRight( false, false, -107, 103 )
	teamcolor:setTopBottom( true, false, 0, 65 )
	teamcolor:setYRot( 180 )
	teamcolor:setImage( RegisterImage( "uie_t7_codcaster_colorback" ) )
	self:addElement( teamcolor )
	self.teamcolor = teamcolor
	
	local logobacking = LUI.UIImage.new()
	logobacking:setLeftRight( true, false, 25, 136 )
	logobacking:setTopBottom( true, false, 2, 67 )
	logobacking:setYRot( 180 )
	logobacking:setImage( RegisterImage( "uie_t7_codcaster_logobottom" ) )
	self:addElement( logobacking )
	self.logobacking = logobacking
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 33, 130.63 )
	emblem:setTopBottom( true, false, 5, 63 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 25, 131 )
	logo:setTopBottom( true, false, 5, 63.55 )
	logo:setImage( RegisterImage( "uie_t7_codcaster_faction2" ) )
	self:addElement( logo )
	self.logo = logo
	
	local logotopRight = LUI.UIImage.new()
	logotopRight:setLeftRight( true, false, 23, 138 )
	logotopRight:setTopBottom( true, false, 2, 67 )
	logotopRight:setYRot( 180 )
	logotopRight:setImage( RegisterImage( "uie_t7_codcaster_logotop" ) )
	self:addElement( logotopRight )
	self.logotopRight = logotopRight
	
	local numberbacking = LUI.UIImage.new()
	numberbacking:setLeftRight( true, false, 115, 206 )
	numberbacking:setTopBottom( true, false, 0, 66 )
	numberbacking:setYRot( 180 )
	numberbacking:setImage( RegisterImage( "uie_t7_codcaster_numberbacking" ) )
	self:addElement( numberbacking )
	self.numberbacking = numberbacking
	
	local teamiconbg = LUI.UIImage.new()
	teamiconbg:setLeftRight( false, false, -84, -58 )
	teamiconbg:setTopBottom( true, false, 1.5, 66.5 )
	teamiconbg:setYRot( 180 )
	teamiconbg:setImage( RegisterImage( "uie_t7_codcaster_blackbar" ) )
	self:addElement( teamiconbg )
	self.teamiconbg = teamiconbg
	
	local teamiconbg0 = LUI.UIImage.new()
	teamiconbg0:setLeftRight( false, false, -86, -60 )
	teamiconbg0:setTopBottom( true, false, 1.8, 66.5 )
	teamiconbg0:setYRot( 180 )
	teamiconbg0:setImage( RegisterImage( "uie_t7_codcaster_blackbar" ) )
	self:addElement( teamiconbg0 )
	self.teamiconbg0 = teamiconbg0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				teamcolor:completeAnimation()
				self.teamcolor:setAlpha( 1 )
				self.clipFinished( teamcolor, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				logo:completeAnimation()
				self.logo:setAlpha( 1 )
				self.clipFinished( logo, {} )
			end
		},
		NonTeamBased = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				teamcolor:completeAnimation()
				self.teamcolor:setRGB( 1, 1, 1 )
				self.teamcolor:setAlpha( 1 )
				self.clipFinished( teamcolor, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 1 )
				self.clipFinished( emblem, {} )
				logo:completeAnimation()
				self.logo:setAlpha( 0 )
				self.clipFinished( logo, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NonTeamBased",
			condition = function ( menu, element, event )
				return not IsGametypeTeambased()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

